import {
    IsBoolean,
    IsDate,
    IsEmail,
    IsNotEmpty,
    IsString,
    Max,
    MaxLength,
    ValidateNested,
} from 'class-validator';
import { Type } from 'class-transformer';

export class WorkExperienceDto {
    @IsString()
    @IsNotEmpty()
    readonly companyName: string;

    @IsString()
    @IsNotEmpty()
    readonly employmentType: string;

    @IsString()
    @IsNotEmpty()
    @Max(50)
    readonly titleWork: string;

    @IsBoolean()
    readonly isCurrent: Boolean;

    @IsDate()
    readonly date: Date;

    @IsString()
    @IsNotEmpty()
    @Max(230)
    readonly description: string;
}

export class OwnerProjectDto {
    @IsString()
    @IsNotEmpty()
    @Max(50)
    readonly titleProject: string;

    @IsString()
    @IsNotEmpty()
    @Max(230)
    readonly descriptionProject: string;

    @MaxLength(50, {
        each: true,
    })
    readonly skills: string[];

    @IsString()
    @IsNotEmpty()
    readonly role: string;
}

export class UserDto {
    @IsString()
    @Max(10)
    readonly username: string;

    @IsString()
    @IsNotEmpty()
    readonly avatar_url: string;

    @IsString()
    @IsNotEmpty()
    readonly profesion: string;

    @IsEmail()
    @IsNotEmpty()
    readonly email: string;

    @MaxLength(10, {
        each: true,
    })
    readonly skills: string[];

    @IsString()
    @IsNotEmpty()
    @Max(80)
    readonly descriptionLong: string;

    @IsString()
    @IsNotEmpty()
    @Max(300)
    readonly about: string;

    @MaxLength(10, {
        each: true,
    })
    readonly social: string[];

    @ValidateNested()
    @Type(() => WorkExperienceDto)
    readonly workExperience: WorkExperienceDto;

    @ValidateNested()
    @Type(() => OwnerProjectDto)
    readonly ownerProject: OwnerProjectDto;
}