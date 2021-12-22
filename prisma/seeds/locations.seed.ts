import { PrismaClient, Location, LocationType, UserType } from "@prisma/client";

const prisma = new PrismaClient();

const locations: Array<Location> = [
  {
    locationId: 1,
    name: "Downtown Gym",
    locationType: LocationType.gym,
    companyCompanyId: 1,
    address: null,
    phone: null,
    email: null,
    isActive: true,
    userType: UserType.client,
  },
];

export const locationsSeed = async () => {
  locations.forEach(async (location) => {
    try {
      await prisma.location.create({
        data: location,
      });
    } catch (e) {
      console.error(e);
    }
  });
};
