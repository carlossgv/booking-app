import { Company, LocationType, UserType } from ".prisma/client";

export class CreateLocationDto {
  name: string;
  description?: string;
  address?: string;
  phone?: string;
  email?: string;
  locationType: LocationType;
  userType: UserType;
  Company: Company;
}
