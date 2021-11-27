import { Test, TestingModule } from "@nestjs/testing";
import { PrismaService } from "../prisma.service";
import { CreateLocationDto } from "./dto/create-location.dto";
import { LocationsController } from "./locations.controller";
import { LocationsService } from "./locations.service";

describe("LocationsController", () => {
  let locationsController: LocationsController;
  let locationsService: LocationsService;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      controllers: [LocationsController],
      providers: [LocationsService, PrismaService],
    }).compile();

    locationsController = module.get<LocationsController>(LocationsController);
    locationsService = module.get<LocationsService>(LocationsService);
  });

  it("should be defined", () => {
    expect(locationsController).toBeDefined();
  });

  it("should create a new location", async () => {
    const result: CreateLocationDto = {
      name: "test",
      address: "test",
      locationType: "other",
    };
  });
});
