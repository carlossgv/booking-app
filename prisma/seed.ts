import { PrismaClient } from "@prisma/client";
import { companiesSeed } from "./seeds/companies.seed";
import { locationsSeed } from "./seeds/locations.seed";
import { locationsUsersSeed } from "./seeds/locationUsers.seed";

const prisma = new PrismaClient();

const seeds = [companiesSeed(), locationsSeed(), locationsUsersSeed()];

const main = async () => {
  seeds.forEach(async (seed) => {
    seed;
  });
};

main()
  .catch((e) => console.error(e))
  .finally(async () => {
    await prisma.$disconnect();
  });
