import { Test, TestingModule } from "@nestjs/testing";
import { PrismaService } from "../prisma.service";
import { CreateLocationDto } from "./dto/create-location.dto";
import { LocationsController } from "./locations.controller";
import { LocationsService } from "./locations.service";

describe("LocationsController", () => {
  let locationsController: LocationsController;
  let createdLocationId: string;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      controllers: [LocationsController],
      providers: [LocationsService, PrismaService],
    }).compile();

    locationsController = module.get<LocationsController>(LocationsController);
  });

  it("should be defined", () => {
    expect(locationsController).toBeDefined();
  });

  it("should create a new location", async () => {
    const createLocationDto: CreateLocationDto = {
      name: "Test Location",
      address: "Test Address",
      locationType: "other",
    };

    const location = await locationsController.create(createLocationDto);
    createdLocationId = location.id.toString();
    expect(location).toBeDefined();
    expect(location.name).toBe(createLocationDto.name);
  });

  it("should retrieve all locations", async () => {
    const locations = await locationsController.findAll();
    expect(locations).toBeDefined();
    expect(locations.length).toBeGreaterThan(0);
    expect(locations[locations.length - 1].name).toBe("Test Location");
  });

  it("should retrieve a location by id", async () => {
    const location = await locationsController.findOne(createdLocationId);
    expect(location).toBeDefined();
    expect(location.name).toBe("Test Location");
  });

  it("should update a location", async () => {
    const location = await locationsController.update(createdLocationId, {
      name: "Best Updated Test Location",
      address: "Test Address Changed",
    });
    expect(location).toBeDefined();
    expect(location.name).toBe("Best Updated Test Location");
    expect(location.address).toBe("Test Address Changed");
    expect(location.locationType).toBe("other");
  });

  it("should delete a location", async () => {
    const location = await locationsController.delete(createdLocationId);
    expect(location).toBeDefined();
    expect(location.name).toBe("Best Updated Test Location");
  });
});
