-- CreateTable
CREATE TABLE "User" (
    "id" SERIAL NOT NULL,
    "username" VARCHAR(15),
    "avatar_url" TEXT NOT NULL,
    "profesion" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "skills" TEXT[],
    "descriptionLong" VARCHAR(80) NOT NULL,
    "about" VARCHAR(300) NOT NULL,
    "social" TEXT[],
    "workExperience" TEXT NOT NULL,
    "ownerProjectId" TEXT NOT NULL,
    "companyName" TEXT NOT NULL,
    "employmentType" TEXT NOT NULL,
    "titleWork" VARCHAR(80) NOT NULL,
    "isCurrent" BOOLEAN NOT NULL,
    "isAdminUser" BOOLEAN NOT NULL DEFAULT false,
    "date" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "description" VARCHAR(300) NOT NULL,
    "titleProject" VARCHAR(80) NOT NULL,
    "descriptionProject" VARCHAR(300) NOT NULL,
    "workSkills" TEXT[],
    "role" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "password" TEXT NOT NULL,

    CONSTRAINT "User_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "WorkPost" (
    "id" SERIAL NOT NULL,
    "authorId" INTEGER NOT NULL,
    "projectTitle" TEXT NOT NULL,
    "projectLocation" TEXT NOT NULL,
    "isProjectRemote" BOOLEAN NOT NULL DEFAULT false,
    "salaryRange" DECIMAL(65,30) NOT NULL,
    "isPayment" BOOLEAN NOT NULL DEFAULT false,
    "skills" TEXT[],
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "modifiedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "WorkPost_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "CandidatesList" (
    "id" SERIAL NOT NULL,
    "userId" INTEGER NOT NULL,
    "username" TEXT NOT NULL,
    "descriptionLong" TEXT NOT NULL,
    "workId" INTEGER NOT NULL,
    "isAccepted" BOOLEAN NOT NULL DEFAULT false,
    "isWaitingResponse" BOOLEAN NOT NULL DEFAULT true,

    CONSTRAINT "CandidatesList_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "CompanionsProject" (
    "id" SERIAL NOT NULL,
    "idCompanion" INTEGER NOT NULL,

    CONSTRAINT "CompanionsProject_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Reports" (
    "id" SERIAL NOT NULL,
    "userReporteredId" INTEGER NOT NULL,
    "titleReport" TEXT NOT NULL,
    "typeReport" TEXT NOT NULL,
    "descriptionReport" TEXT NOT NULL,
    "isPending" BOOLEAN NOT NULL DEFAULT true,
    "isResolved" BOOLEAN NOT NULL DEFAULT false,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "Reports_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Bookmarks" (
    "id" SERIAL NOT NULL,
    "idPost" INTEGER NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "Bookmarks_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "User_username_key" ON "User"("username");

-- CreateIndex
CREATE UNIQUE INDEX "User_email_key" ON "User"("email");

-- AddForeignKey
ALTER TABLE "WorkPost" ADD CONSTRAINT "WorkPost_authorId_fkey" FOREIGN KEY ("authorId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CandidatesList" ADD CONSTRAINT "CandidatesList_workId_fkey" FOREIGN KEY ("workId") REFERENCES "WorkPost"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CandidatesList" ADD CONSTRAINT "CandidatesList_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Reports" ADD CONSTRAINT "Reports_userReporteredId_fkey" FOREIGN KEY ("userReporteredId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Bookmarks" ADD CONSTRAINT "Bookmarks_idPost_fkey" FOREIGN KEY ("idPost") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
