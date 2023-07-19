-- CreateTable
CREATE TABLE "BandPost" (
    "id" SERIAL NOT NULL,
    "email" TEXT NOT NULL,
    "published" BOOLEAN NOT NULL DEFAULT false,
    "heading" TEXT NOT NULL,
    "name" TEXT,
    "location" TEXT NOT NULL,
    "body" TEXT NOT NULL,
    "spotifyLink" TEXT,
    "soundCloudLink" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "BandPost_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "MemberPost" (
    "id" SERIAL NOT NULL,
    "email" TEXT NOT NULL,
    "published" BOOLEAN NOT NULL DEFAULT false,
    "heading" TEXT NOT NULL,
    "name" TEXT,
    "location" TEXT NOT NULL,
    "body" TEXT NOT NULL,
    "spotifyLink" TEXT,
    "soundCloudLink" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "MemberPost_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Keyword" (
    "id" SERIAL NOT NULL,
    "keyword" TEXT NOT NULL,

    CONSTRAINT "Keyword_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Link" (
    "id" SERIAL NOT NULL,
    "url" TEXT NOT NULL,
    "bandPostId" INTEGER,
    "memberPostId" INTEGER,

    CONSTRAINT "Link_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "_BandPostToKeyword" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateTable
CREATE TABLE "_KeywordToMemberPost" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "Keyword_keyword_key" ON "Keyword"("keyword");

-- CreateIndex
CREATE UNIQUE INDEX "_BandPostToKeyword_AB_unique" ON "_BandPostToKeyword"("A", "B");

-- CreateIndex
CREATE INDEX "_BandPostToKeyword_B_index" ON "_BandPostToKeyword"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_KeywordToMemberPost_AB_unique" ON "_KeywordToMemberPost"("A", "B");

-- CreateIndex
CREATE INDEX "_KeywordToMemberPost_B_index" ON "_KeywordToMemberPost"("B");

-- AddForeignKey
ALTER TABLE "Link" ADD CONSTRAINT "Link_bandPostId_fkey" FOREIGN KEY ("bandPostId") REFERENCES "BandPost"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Link" ADD CONSTRAINT "Link_memberPostId_fkey" FOREIGN KEY ("memberPostId") REFERENCES "MemberPost"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_BandPostToKeyword" ADD CONSTRAINT "_BandPostToKeyword_A_fkey" FOREIGN KEY ("A") REFERENCES "BandPost"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_BandPostToKeyword" ADD CONSTRAINT "_BandPostToKeyword_B_fkey" FOREIGN KEY ("B") REFERENCES "Keyword"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_KeywordToMemberPost" ADD CONSTRAINT "_KeywordToMemberPost_A_fkey" FOREIGN KEY ("A") REFERENCES "Keyword"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_KeywordToMemberPost" ADD CONSTRAINT "_KeywordToMemberPost_B_fkey" FOREIGN KEY ("B") REFERENCES "MemberPost"("id") ON DELETE CASCADE ON UPDATE CASCADE;
