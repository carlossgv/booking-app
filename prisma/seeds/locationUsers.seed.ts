import { PrismaClient, LocationUser } from "@prisma/client";

const prisma = new PrismaClient();

const locationUsers: Array<LocationUser> = [
  {
    locationUserId: 1,
    userId: 2,
    isActive: true,
    locationLocationId: 1,
  },
];

export const locationsUsersSeed = async () => {
  locationUsers.forEach(async (user) => {
    try {
      await prisma.locationUser.create({
        data: user,
      });
    } catch (e) {
      console.error(e);
    }
  });
};
