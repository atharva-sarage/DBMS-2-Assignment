-- check multivalued attributes
CREATE TABLE Person (
	PersonID char(9),
  Name varchar,
	BirthYear integer,
  Gender char(6),
  Languages MultiValued,
	PRIMARY KEY (PersonID)
);

CREATE TABLE TVSeries (
  TVID char(9),
  OriginalTitle varchar,
  LanguagesOfRelease MultiValued,
  Status varchar,
  Crew MultiValued,
  NumVotes integer,
  isAdult boolean,
  Cast MultiValued,
  Rating real,
  Budget real,
  Titles MultiValued,
  PRIMARY KEY (TVID)
);

CREATE TABLE Movie (
  MovieID char(9),
  OriginalTitle varchar,
  LanguagesOfRelease MultiValued,
  Crew MultiValued,
  NumVotes integer,
  isAdult boolean,
  Cast MultiValued,
  Rating real,
  Budget real,
  BoxOfficeGross real,
  Titles MultiValued,
  PRIMARY KEY (MovieID)
);

CREATE TABLE Award (
  AwardName varchar,
  Year INTEGER,
  PRIMARY KEY (AwardName)
);

CREATE TABLE Region (
  Name varchar,
  PRIMARY KEY (Name)
);

CREATE TABLE Genre (
  Genre varchar,
  PRIMARY KEY (genre)
);


create table actorMovie {
  MovieID char(9) references movie(MovieID) ON DELETE CASCADE ON UPDATE CASCADE ,
  PersonID char(9) references person(PersonID) ON DELETE CASCADE ON UPDATE CASCADE,
  Name varchar,     
  PRIMARY KEY(MovieID,PersonID)
};
create table directorMovie {
  MovieID char(9) references movie(MovieID) ON DELETE CASCADE ON UPDATE CASCADE ,
  PersonID char(9) references person(PersonID) ON DELETE CASCADE ON UPDATE CASCADE ,
  PRIMARY KEY(MovieID,PersonID)  
};
create table crewMovie {
  MovieID char(9) references movie(MovieID) ON DELETE CASCADE ON UPDATE CASCADE ,
  PersonID char(9) references person(PersonID) ON DELETE CASCADE ON UPDATE CASCADE ,
  Type INT,
  PRIMARY KEY(MovieID,PersonID,Type)
};
create table EpisodeTVSeries {
    MovieID char(9) references movie(MovieID) ON DELETE CASCADE ON UPDATE CASCADE ,
    EpisodeID char(9) references episode(EpisodeID) ON DELETE CASCADE ON UPDATE CASCADE,
    PRIMARY KEY(MovieID,PersonID)    
};
create table RegionMovie{
  MovieID char(9) references movie(MovieID) ON DELETE CASCADE ON UPDATE CASCADE,
  RegionName varchar references region(RegionName) ON DELETE CASCADE ON UPDATE CASCADE,
  Runtime INT,
  StartDate varchar,
  EndDate varchar
  PRIMARY KEY(MovieID,RegionName)
};
create table movieGenre{
    MovieID char(9) references movie(MovieID) ON DELETE CASCADE ON UPDATE CASCADE,
    Genre varchar references genre(Genre) ON DELETE CASCADE ON UPDATE CASCADE,
    PRIMARY KEY(MovieID,Genre)
};
create table productionCompanyMovie{
    MovieID char(9) references movie(MovieID) ON DELETE CASCADE ON UPDATE CASCADE,
    CompanyName varchar references productionComany(CompanyName) ON DELETE CASCADE ON UPDATE CASCADE,
    PRIMARY KEY(MovieID,CompanyName)
};
-- need to confirm this Actor Award
create table ActorAward{
    AwardName varchar references award(AwardName) ON DELETE CASCADE ON UPDATE CASCADE,
    MovieID char(9) references movie(MovieID) ON DELETE CASCADE ON UPDATE CASCADE,
    PersonID char(9) references person(PersonID) ON DELETE CASCADE ON UPDATE CASCADE,
    AwardType INT PRIMARY KEY,
    PRIMARY KEY(MovieID,PersonID,AwardName,AwardType)
}


CREATE TABLE Episodes (
	EpisodeId char(9),
	TVSeriesId char(9) REFERENCES TVSeries (TVID) ON DELETE CASCADE ON UPDATE CASCADE,
	Title varchar,
	SeasonNo integer CHECK(SeasonNo >= 1),
	EpisodeNo integer CHECK(EpisodeNo >= 1),
	Rating real,
	PRIMARY KEY (EpisodeID, TVSeriesId)
);

CREATE TABLE Actor (
	PersonID char(9) PRIMARY KEY REFERENCES Person (PersonID) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Crew (
	PersonID char(9) REFERENCES Person (PersonID) ON DELETE CASCADE ON UPDATE CASCADE,
	Type integer,
	PRIMARY KEY (PersonID, Type)
);

CREATE TABLE Director (
	PersonID char(9) PRIMARY KEY REFERENCES Person (PersonID) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE TV_Actor (
	PersonID char(9) PRIMARY KEY REFERENCES Person (PersonID) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE TV_Crew (
	PersonID char(9) REFERENCES Person (PersonID) ON DELETE CASCADE ON UPDATE CASCADE,
	Type integer,
	PRIMARY KEY (PersonID, Type)
);

CREATE TABLE TV_Director (
	PersonID char(9) PRIMARY KEY REFERENCES Person (PersonID) ON DELETE CASCADE ON UPDATE CASCADE
);

