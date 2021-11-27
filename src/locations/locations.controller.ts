import {
  Controller,
  Get,
  Post,
  Body,
  Patch,
  Param,
  Delete,
} from "@nestjs/common";
import { LocationsService } from "./locations.service";
import { CreateLocationDto } from "./dto/create-location.dto";
import { UpdateLocationDto } from "./dto/update-location.dto";
import { PrismaService } from "../prisma.service";

@Controller("locations")
export class LocationsController {
  constructor(
    private readonly locationsService: LocationsService,
    private prisma: PrismaService,
  ) {}

  @Post()
  create(@Body() createLocationDto: CreateLocationDto) {
    return this.locationsService.create(createLocationDto);
  }

  @Get()
  findAll() {
    return this.locationsService.findAll();
  }

  @Get(":id")
  findOne(@Param("id") id: string) {
    return this.locationsService.findOne(+id);
  }

  @Patch(":id")
  update(
    @Param("id") id: string,
    @Body() updateLocationDto: UpdateLocationDto,
  ) {
    return this.locationsService.update(+id, updateLocationDto);
  }

  @Delete(":id")
  delete(@Param("id") id: string) {
    return this.locationsService.remove(+id);
  }
}
