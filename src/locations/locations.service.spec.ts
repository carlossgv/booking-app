import { Test, TestingModule } from "@nestjs/testing";
import { PrismaService } from "../prisma.service";
import { LocationsModule } from "./locations.module";
import { LocationsService } from "./locations.service";

describe("LocationsService", () => {
  let service: LocationsService;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      imports: [LocationsModule],
      providers: [LocationsService, PrismaService],
    }).compile();

    service = module.get<LocationsService>(LocationsService);
  });

  it("should be defined", () => {
    expect(service).toBeDefined();
  });
});
