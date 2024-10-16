SELECT TOP (1000) [game_id]
      ,[league_id]
      ,[team_id_home]
      ,[team_abbreviation_home]
      ,[team_city_home]
      ,[pts_paint_home]
      ,[pts_2nd_chance_home]
      ,[pts_fb_home]
      ,[largest_lead_home]
      ,[lead_changes]
      ,[times_tied]
      ,[team_turnovers_home]
      ,[total_turnovers_home]
      ,[team_rebounds_home]
      ,[pts_off_to_home]
      ,[team_id_away]
      ,[team_abbreviation_away]
      ,[team_city_away]
      ,[pts_paint_away]
      ,[pts_2nd_chance_away]
      ,[pts_fb_away]
      ,[largest_lead_away]
      ,[team_turnovers_away]
      ,[total_turnovers_away]
      ,[team_rebounds_away]
      ,[pts_off_to_away]
  FROM [Sportics_LAM].[dbo].[others_stats]


  --correccion de las columnas que deben ser dividivas por 10 pra que esten bien cargadas
  UPDATE others_stats
SET
    team_turnovers_home = ISNULL(team_turnovers_home, 0) / 10,
    total_turnovers_home = ISNULL(total_turnovers_home, 0) / 10,
    team_rebounds_home = ISNULL(team_rebounds_home, 0) / 10,
	pts_off_to_home = ISNULL(pts_off_to_home, 0) / 10,
	team_turnovers_away= ISNULL(team_turnovers_away, 0) / 10,
	total_turnovers_away = ISNULL(total_turnovers_away, 0) / 10,
	team_rebounds_away = ISNULL(team_rebounds_away, 0) / 10,
	pts_off_to_away = ISNULL(pts_off_to_away, 0) / 10;

	  UPDATE common_player_info
SET
    weight = ISNULL(weight, 0) / 10,
    season_exp = ISNULL(season_exp, 0) / 10,
    from_year = ISNULL(from_year, 0) / 10,
	to_year = ISNULL(to_year, 0) / 10;
	
	  UPDATE game_filtered_by_date
SET
    fgm_home = ISNULL(fgm_home, 0) / 10,
    fga_home = ISNULL(fga_home, 0) / 10,
    fg3m_home = ISNULL(fg3m_home, 0) / 10,
	fg3a_home = ISNULL(fg3a_home, 0) / 10,
	ftm_home= ISNULL(ftm_home, 0) / 10,
	fta_home = ISNULL(fta_home, 0) / 10,
	oreb_home = ISNULL(oreb_home, 0) / 10,
	dreb_home = ISNULL(dreb_home, 0) / 10,
	reb_home = ISNULL(reb_home, 0) / 10,
	ast_home = ISNULL(ast_home, 0) / 10,
	stl_home = ISNULL(stl_home, 0) / 10,
	blk_home = ISNULL(blk_home, 0) / 10,
	tov_home = ISNULL(tov_away, 0) / 10,
	pf_home = ISNULL(pf_home, 0) / 10,
	pts_home = ISNULL(pts_home, 0) / 10,
	fgm_away = ISNULL(fgm_away, 0) / 10,
	fga_away = ISNULL(fga_away, 0) / 10,
	fg3m_away = ISNULL(fg3m_away, 0) / 10,
	fg3a_away = ISNULL(fg3a_away, 0) / 10,
	ftm_away = ISNULL(ftm_away, 0) / 10,
	fta_away = ISNULL(fta_away, 0) / 10,
	oreb_away = ISNULL(oreb_away, 0) / 10,
	dreb_away = ISNULL(dreb_away, 0) / 10,
	reb_away = ISNULL(reb_away, 0) / 10,
	ast_away = ISNULL(ast_away, 0) / 10,
	stl_away = ISNULL(stl_away, 0) / 10,
	blk_away = ISNULL(blk_away, 0) / 10,
	tov_away = ISNULL(tov_away, 0) / 10,
	pf_away = ISNULL(pf_away, 0) / 10,
	pts_away = ISNULL(pts_away, 0) / 10;


	  UPDATE line_score
SET
    game_sequence = ISNULL(game_sequence, 0) / 10,
    pts_qtr1_home = ISNULL(pts_qtr1_home, 0) / 10,
    pts_qtr2_home = ISNULL(pts_qtr2_home, 0) / 10,
	pts_qtr3_home = ISNULL(pts_qtr3_home, 0) / 10,
	pts_qtr4_home= ISNULL(pts_qtr4_home, 0) / 10,
	pts_home = ISNULL(pts_home, 0) / 10,
	pts_qtr1_away = ISNULL(pts_qtr1_away, 0) / 10,
	pts_qtr2_away = ISNULL(pts_qtr2_away, 0) / 10,
	pts_qtr3_away = ISNULL(pts_qtr3_away, 0) / 10,
	pts_qtr4_away = ISNULL(pts_qtr4_away, 0) / 10,
	pts_away = ISNULL(pts_away, 0) / 10;
	
		  UPDATE player_stats
SET
    MP = ISNULL(MP, 0) / 10,
    FG = ISNULL(FG, 0) / 10,
    FGA = ISNULL(FGA, 0) / 10,
	FG1 = ISNULL(FG1, 0) / 10,
	_3P= ISNULL(_3P, 0) / 10,
	_3PA = ISNULL(_3PA, 0) / 10,
	_3P1 = ISNULL(_3P1, 0) / 10,
	_2P = ISNULL(_2P, 0) / 10,
	_2PA = ISNULL(_2PA, 0) / 10,
	_2P1 = ISNULL(_2P1, 0) / 10,
	eFG = ISNULL(eFG, 0) / 10,
	FT = ISNULL(FT, 0) / 10,
	FTA = ISNULL(FTA, 0) / 10,
	FT1 = ISNULL(FT1, 0) / 10,
	ORB = ISNULL(ORB, 0) / 10,
	DRB = ISNULL(DRB, 0) / 10,
	TRB = ISNULL(TRB, 0) / 10,
	AST = ISNULL(AST, 0) / 10,
	STL = ISNULL(STL, 0) / 10,
	BLK = ISNULL(BLK, 0) / 10,
	TOV = ISNULL(TOV, 0) / 10,
	PF = ISNULL(PF, 0) / 10,
	PTS = ISNULL(PTS, 0) / 10;
	
	
	select * from team;
	
		  UPDATE team
SET
    year_founded = ISNULL(year_founded, 0) / 10;