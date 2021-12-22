import { Company, PrismaClient } from "@prisma/client";

const prisma = new PrismaClient();

const companies: Array<Company> = [
  {
    companyId: 1,
    name: "The Best Gym Ever",
    isActive: true,
    address: null,
    email: null,
  },
  {
    companyId: 2,
    name: "Dr. Carlos Consultation",
    isActive: true,
    address: null,
    email: null,
  },
  {
    companyId: 3,
    name: "Nice Bar",
    isActive: false,
    address: null,
    email: null,
  },
];

export const companiesSeed = async () => {
  companies.forEach(async (company) => {
    try {
      await prisma.company.create({
        data: company,
      });
    } catch (e) {
      console.error(e);
    }
  });
};
