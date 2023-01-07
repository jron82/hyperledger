CREATE TYPE "public"."Role" AS ENUM ('ADMIN', 'ACCOUNTANT');
CREATE TYPE "public"."Quarter" AS ENUM ('Q1', 'Q2', 'Q3', 'Q4');

-- Table Definition
CREATE TABLE "public"."user" (
    "id" text NOT NULL,
    "name" text,
    "email" text,
    "role" "public"."Role" NOT NULL DEFAULT 'ADMIN'::"Role",
    PRIMARY KEY ("id")
);

-- Table Definition
CREATE TABLE "public"."expense" (
    "id" text NOT NULL,
    "userId" text NOT NULL,
    "amount" int4 NOT NULL DEFAULT 0,
    "description" text NOT NULL DEFAULT ''::text,
    "createdAt" timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY ("id")
);

-- This script only contains the table creation statements and does not fully represent the table in the database. It's still missing: indices, triggers. Do not use it as a backup.

-- Table Definition
CREATE TABLE "public"."invoice" (
    "id" text NOT NULL,
    "userId" text NOT NULL,
    "amount" int4 NOT NULL DEFAULT 0,
    "description" text NOT NULL DEFAULT ''::text,
    "emailSent" bool NOT NULL DEFAULT false,
    "invoicedAt" timestamp(3) NOT NULL,
    "paidAt" timestamp(3),
    "createdAt" timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" timestamp(3) NOT NULL,
    PRIMARY KEY ("id")
);

-- This script only contains the table creation statements and does not fully represent the table in the database. It's still missing: indices, triggers. Do not use it as a backup.

-- Table Definition
CREATE TABLE "public"."session" (
    "id" text NOT NULL,
    "token" text NOT NULL,
    "userId" text NOT NULL,
    "expires" timestamp(3) NOT NULL,
    PRIMARY KEY ("id")
);

-- This script only contains the table creation statements and does not fully represent the table in the database. It's still missing: indices, triggers. Do not use it as a backup.

DROP TYPE IF EXISTS "public"."quarter";

-- Table Definition
CREATE TABLE "public"."tax_payment" (
    "id" text NOT NULL,
    "userId" text NOT NULL,
    "amount" int4 NOT NULL DEFAULT 0,
    "description" text NOT NULL DEFAULT ''::text,
    "quarter" "public"."Quarter" NOT NULL,
    "year" int4 NOT NULL,
    "createdAt" timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY ("id")
);


ALTER TABLE "public"."expense" ADD FOREIGN KEY ("userId") REFERENCES "public"."User"("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "public"."invoice" ADD FOREIGN KEY ("userId") REFERENCES "public"."User"("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "public"."session" ADD FOREIGN KEY ("userId") REFERENCES "public"."User"("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "public"."tax_payment" ADD FOREIGN KEY ("userId") REFERENCES "public"."User"("id") ON DELETE CASCADE ON UPDATE CASCADE;
