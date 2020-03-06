create table actorMovie {
  MovieID char(9) refrences movie(MovieID) ON DELETE CASCADE ON UPDATE CASCADE primary key,
  PersonID char(9) references person(PersonID) ON DELETE CASCADE ON UPDATE CASCADE primary key,
  Name varchar     
};
create table directorMovie {
  MovieID char(9) refrences movie(MovieID) ON DELETE CASCADE ON UPDATE CASCADE primary key,
  PersonID char(9) references person(PersonID) ON DELETE CASCADE ON UPDATE CASCADE primary key,  
};
create table crewMovie {
  MovieID char(9) refrences movie(MovieID) ON DELETE CASCADE ON UPDATE CASCADE primary key,
  PersonID char(9) references person(PersonID) ON DELETE CASCADE ON UPDATE CASCADE primary key,
  Type INT primary key
};
create table EpisodeTVSeries {
    MovieID char(9) refrences movie(MovieID) ON DELETE CASCADE ON UPDATE CASCADE primary key,
    EpisodeID char(9) refrences episode(EpisodeID) ON DELETE CASCADE ON UPDATE CASCADE primary key    
};
create table RegionMovie{
  MovieID char(9) refrences movie(MovieID) ON DELETE CASCADE ON UPDATE CASCADE primary key,
  RegionName varchar refrences region(RegionName) ON DELETE CASCADE ON UPDATE CASCADE primary key,
  Runtime INT,
  StartDate varchar,
  EndDate varchar
};
create table movieGenre{
    MovieID char(9) refrences movie(MovieID) ON DELETE CASCADE ON UPDATE CASCADE primary key,
    Genre varchar refrences genre(Genre) ON DELETE CASCADE ON UPDATE CASCADE primary key
};
create table productionCompanyMovie{
    MovieID char(9) refrences movie(MovieID) ON DELETE CASCADE ON UPDATE CASCADE primary key,
    CompanyName varchar refrences productionComany(CompanyName) ON DELETE CASCADE ON UPDATE CASCADE primary key
};
-- need to confirm this Actor Award
create table ActorAward{
    AwardName varchar refrences award(AwardName) ON DELETE CASCADE ON UPDATE CASCADE primary key,
    MovieID char(9) refrences movie(MovieID) ON DELETE CASCADE ON UPDATE CASCADE primary key,
    PersonID char(9) references person(PersonID) ON DELETE CASCADE ON UPDATE CASCADE primary key,
    AwardType INT primary key,
}

