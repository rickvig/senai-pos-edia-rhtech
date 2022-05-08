CREATE TABLE "public.empresa" (
	"id" serial NOT NULL,
	"nome" varchar(255) NOT NULL,
	CONSTRAINT "empresa_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.departamento" (
	"id" serial NOT NULL,
	"nome" varchar(255) NOT NULL,
	CONSTRAINT "departamento_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.item_nota" (
	"id" serial NOT NULL,
	"produto" varchar(255) NOT NULL,
	"valor" DECIMAL NOT NULL,
	"quantidade" DECIMAL NOT NULL,
	"id_nota" BINARY NOT NULL,
	CONSTRAINT "item_nota_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.colaborar" (
	"id" serial NOT NULL,
	"nome" varchar(255) NOT NULL,
	"salario" DECIMAL NOT NULL,
	"id_departamento" BINARY NOT NULL,
	"id_cargo" DECIMAL NOT NULL,
	CONSTRAINT "colaborar_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.nota_fiscal" (
	"id" serial NOT NULL,
	"data" DATE NOT NULL,
	"id_empresa" BINARY NOT NULL,
	CONSTRAINT "nota_fiscal_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.folha_pagamento" (
	"id" serial NOT NULL,
	"id_colaborador" BINARY NOT NULL,
	"data" DATE NOT NULL,
	"hora_extra" DECIMAL NOT NULL,
	"valor" DECIMAL NOT NULL,
	CONSTRAINT "folha_pagamento_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.departamento_empresa" (
	"id_departamento" BINARY NOT NULL,
	"id_empresa" BINARY NOT NULL
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.ponto" (
	"id" serial NOT NULL,
	"id_colaborador" BINARY NOT NULL,
	"data_entrada" DATE NOT NULL,
	"data_saida" DATE NOT NULL,
	CONSTRAINT "ponto_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.cargo" (
	"id" serial NOT NULL,
	"nome" varchar(255) NOT NULL,
	"valor_hora_extra" DATETIME NOT NULL,
	"id_departamento" BINARY NOT NULL,
	CONSTRAINT "cargo_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);





ALTER TABLE "item_nota" ADD CONSTRAINT "item_nota_fk0" FOREIGN KEY ("id_nota") REFERENCES "nota_fiscal"("id");

ALTER TABLE "colaborar" ADD CONSTRAINT "colaborar_fk0" FOREIGN KEY ("id_departamento") REFERENCES "departamento"("id");
ALTER TABLE "colaborar" ADD CONSTRAINT "colaborar_fk1" FOREIGN KEY ("id_cargo") REFERENCES "cargo"("id");

ALTER TABLE "nota_fiscal" ADD CONSTRAINT "nota_fiscal_fk0" FOREIGN KEY ("id_empresa") REFERENCES "empresa"("id");

ALTER TABLE "folha_pagamento" ADD CONSTRAINT "folha_pagamento_fk0" FOREIGN KEY ("id_colaborador") REFERENCES "colaborar"("id");

ALTER TABLE "departamento_empresa" ADD CONSTRAINT "departamento_empresa_fk0" FOREIGN KEY ("id_departamento") REFERENCES "departamento"("id");
ALTER TABLE "departamento_empresa" ADD CONSTRAINT "departamento_empresa_fk1" FOREIGN KEY ("id_empresa") REFERENCES "empresa"("id");

ALTER TABLE "ponto" ADD CONSTRAINT "ponto_fk0" FOREIGN KEY ("id_colaborador") REFERENCES "colaborar"("id");

ALTER TABLE "cargo" ADD CONSTRAINT "cargo_fk0" FOREIGN KEY ("id_departamento") REFERENCES "departamento"("id");































-------------------------------------------------------------------------
-- GERADO PELO DJANGO 
-------------------------------------------------------------------------



BEGIN;
--
-- Create model Departamento
--
CREATE TABLE "rh_departamento" ("id" bigserial NOT NULL PRIMARY KEY, "nome" varchar(255) NOT NULL);
--
-- Create model Colaborador
--
CREATE TABLE "rh_colaborador" ("id" bigserial NOT NULL PRIMARY KEY, "nome" varchar(255) NOT NULL, "salario" numeric(10, 2) NOT NULL, "departamento_id" bigint NOT NULL);
ALTER TABLE "rh_colaborador" ADD CONSTRAINT "rh_colaborador_departamento_id_79fa9dd2_fk_rh_departamento_id" FOREIGN KEY ("departamento_id") REFERENCES "rh_departamento" ("id") DEFERRABLE INITIALLY DEFERRED;
CREATE INDEX "rh_colaborador_departamento_id_79fa9dd2" ON "rh_colaborador" ("departamento_id");

COMMIT;





