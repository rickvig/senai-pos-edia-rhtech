from django.db import models


class Empresa(models.Model):
    nome = models.CharField(max_length=255)
    
    def __str__(self):
        return self.nome
    

class NotaFiscal(models.Model):
    data_lancamento = models.DateField(max_length=255)

    empresa = models.ForeignKey(Empresa, on_delete=models.PROTECT)
    
    def __str__(self):
        return f'N-{self.id} - {self.data_lancamento} {self.empresa}'


class ItemNotaFiscal(models.Model):
    produto = models.CharField(max_length=255)
    valor_unitario = models.DecimalField(decimal_places=2, max_digits=10)
    quantidade = models.DecimalField(decimal_places=2, max_digits=10)

    nota_fiscal = models.ForeignKey(NotaFiscal, on_delete=models.CASCADE)
    
    def __str__(self):
        return f'{self.id} - {self.produto} / ({self.nota_fiscal.id} - {self.nota_fiscal.data_lancamento})'


class Departamento(models.Model):
    nome = models.CharField(max_length=255)
    empresa = models.ForeignKey(Empresa, on_delete=models.DO_NOTHING)
    
    def __str__(self):
        return self.nome


class Cargo(models.Model):
    nome = models.CharField(max_length=255)
    valor_hora = models.DecimalField(decimal_places=2, max_digits=10)

    departamento = models.ForeignKey(Departamento, on_delete=models.CASCADE)
    
    def __str__(self):
        return f'{self.nome} - Dep: {self.departamento.nome}'


class Colaborador(models.Model):
    nome = models.CharField(max_length=255)
    salario = models.DecimalField(decimal_places=2, max_digits=10)
    cargo = models.ForeignKey(Cargo, on_delete=models.PROTECT, default=1)
    
    def __str__(self):
        return self.nome


class FolhaPagamento(models.Model):
    data_lancamento = models.DateField()
    horas_extras = models.DecimalField(decimal_places=2, max_digits=10)
    saldo_total = models.DecimalField(decimal_places=2, max_digits=10, blank=True, null=True)
    
    colaborador = models.ForeignKey(Colaborador, on_delete=models.DO_NOTHING)
 

class Ponto(models.Model):
    data_entrada = models.DateTimeField()
    data_saida = models.DateTimeField()
    
    expediente = models.DurationField(blank=True, null=True)
    
    colaborador = models.ForeignKey(Colaborador, on_delete=models.DO_NOTHING)
    
    def __str__(self):
        return f'Colab {self.colaborador.id} - {self.data_entrada} :: {self.data_saida} / {self.expediente}'
