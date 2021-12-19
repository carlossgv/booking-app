import { PartialType } from "@nestjs/swagger";
import { Company, LocationType, UserType } from "@prisma/client";
import { CreateLocationDto } from "./create-location.dto";

export class UpdateLocationDto extends PartialType(CreateLocationDto) {
  name?: string;
  description?: string;
  address?: string;
  phone?: string;
  email?: string;
  locationType: LocationType;
  userType: UserType;
  Company: Company;
}
