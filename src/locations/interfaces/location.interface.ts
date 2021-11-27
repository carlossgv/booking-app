import { LocationType } from ".prisma/client";

export interface Location {
  name: string;
  description: string;
  address: string;
  phone: string;
  email: string;
  locationType: LocationType;
}
