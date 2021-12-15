
;;;======================================================
;;;   Automotive Expert System
;;;
;;;     This expert system diagnoses some simple
;;;     problems with a car.
;;;
;;;     CLIPS Version 6.3 Example
;;;
;;;     For use with the Auto Demo Example
;;;======================================================

;;; ***************************
;;; * DEFTEMPLATES & DEFFACTS *
;;; ***************************

(deftemplate UI-state
   (slot id (default-dynamic (gensym*)))
   (slot display)
   (slot relation-asserted (default none))
   (slot response (default none))
   (multislot valid-answers)
   (slot state (default middle)))
   
(deftemplate state-list
   (slot current)
   (multislot sequence))
  
(deffacts startup
   (state-list))
   
;;;****************
;;;* STARTUP RULE *
;;;****************

(defrule system-banner ""

  =>
  
  (assert (UI-state (display WelcomeMessage)
                    (relation-asserted start)
                    (state initial)
                    (valid-answers))))

;;;***************
;;;* QUERY RULES *
;;;***************

(defrule determine-engine-state ""

   (logical (start))

   =>

   (assert (UI-state (display StartQuestion)
                     (relation-asserted theme-choice)
                     (response fantasy)
                     (valid-answers fantasy horror scifi))))
   
(defrule scifi ""

   (logical (theme-choice scifi))

   =>

   (assert (UI-state (display star.wars.query)
                     (relation-asserted starwars-choice)
                     (response No)
                     (valid-answers No Yes))))
(defrule horror ""

   (logical (theme-choice horror))

   =>

   (assert (UI-state (display favourite.monster.query)
                     (relation-asserted monster-choice)
                     (response zombies)
                     (valid-answers zombies cthulhu classic.movie.monster))))
(defrule monster-choice ""

   (logical (monster-choice zombies))

   =>

   (assert (UI-state (display board.cards.query)
                     (relation-asserted type-choice)
                     (response board)
                     (valid-answers board card ))))
(defrule monster-choice2 ""

   (logical (monster-choice cthulhu))

   =>

   (assert (UI-state (display play.on.side.query )
                     (relation-asserted play-with-him)
                     (response well.maybe)
                     (valid-answers well.maybe side.with.elder ))))
(defrule monster-choice3 ""

   (logical (monster-choice classic.movie.monster))

   =>

   (assert (UI-state (display card.based.combat.query)
                     (relation-asserted card-based)
                     (response ill.crush)
                     (valid-answers ill.crush id.rather.be ))))                     
(defrule epic-gateway-choice ""

   (logical (play-with-him side.with.elder))

   =>

   (assert (UI-state (display epic.investigation.query )
                     (relation-asserted epic-inwestigation)
                     (response well.maybe)
                     (valid-answers i.want.epic gateway ))))                                          
(defrule type-choice ""

   (logical (type-choice board))

   =>

   (assert (UI-state (display survival.fittest)
                     (relation-asserted survival-choice)
                     (response zombies.vs)
                     (valid-answers survival.of.the.fittest zombies.vs ))))                   
(defrule zombie-human ""

   (logical (survival-choice zombies.vs))

   =>

   (assert (UI-state (display does.anyone.query)
                     (relation-asserted play-as-zombie)
                     (response all.humans)
                     (valid-answers all.humans brains ))))                                                                                    
(defrule star-wars ""

   (logical (starwars-choice No))

   =>

   (assert (UI-state (display star.trek.query)
                     (relation-asserted startrek-choice)
                     (response No)
                     (valid-answers No Yes))))
(defrule star-wars2 ""

   (logical (starwars-choice Yes))

   =>

   (assert (UI-state (display grand.adventure.query)
                     (relation-asserted grand-adventure)
                     (response Adventure)
                     (valid-answers Adventure PewPew))))                     
(defrule battlestar ""

   (logical (startrek-choice No))

   =>

   (assert (UI-state (display battlestar.query)
                     (relation-asserted battlestar-choice)
                     (response No)
                     (valid-answers No Yes))))   
(defrule battlestar2 ""

   (logical (battlestar-choice No))

   =>

   (assert (UI-state (display explore.expand.query)
                     (relation-asserted explore-expand-choice)
                     (response course)
                     (valid-answers course notright))))                                       
(defrule star-trek ""

   (logical (startrek-choice Yes))

   =>

   (assert (UI-state (display one.on.one.query)
                     (relation-asserted playing-choice)
                     (response Competetive)
                     (valid-answers Competetive Cooperative))))
                   
(defrule explore-expand ""

   (logical (explore-expand-choice course))

   =>

   (assert (UI-state (display how.epic.query)
                     (relation-asserted how-epic-choice)
                     (response work.night.query)
                     (valid-answers all.day.query work.night.query))))
(defrule explore-expand2 ""

   (logical (explore-expand-choice notright))

   =>

   (assert (UI-state (display alien.race.query)
                     (relation-asserted alien-race)
                     (response maybe)
                     (valid-answers maybe soundsfun))))                     
(defrule alien-race-choice ""

   (logical (alien-race maybe))

   =>

   (assert (UI-state (display card.game.query)
                     (relation-asserted card-game-choice)
                     (response sure)
                     (valid-answers sure like.boards))))
(defrule alien-race-choice2 ""

   (logical (alien-race soundsfun))

   =>

   (assert (UI-state (display doing.battle.query)
                     (relation-asserted doing-battle-choice)
                     (response inspace)
                     (valid-answers inspace galacticcenter forearth))))                                            
(defrule card-game-choice ""

   (logical (card-game-choice sure))

   =>

   (assert (UI-state (display deck.builder.query)
                     (relation-asserted deck-builder-choice)
                     (response No)
                     (valid-answers No Yes))))
(defrule living-card-choice ""

   (logical (deck-builder-choice No))

   =>

   (assert (UI-state (display living.card.query)
                     (relation-asserted living-game-choice)
                     (response No)
                     (valid-answers No Yes))))
(defrule card-game-choice2 ""

   (logical (card-game-choice like.boards))

   =>

   (assert (UI-state (display not.alien.query )
                     (relation-asserted not-alien-choice)
                     (response Athlete)
                     (valid-answers Athlete Galacticcorp space.crew merchant ))))
(defrule not-alien-choice ""

   (logical (not-alien-choice merchant))

   =>

   (assert (UI-state (display seriously.query )
                     (relation-asserted seriously)
                     (response bussiness)
                     (valid-answers bussiness giggle)))) 
(defrule not-alien-choice2 ""

   (logical (not-alien-choice space.crew))

   =>

   (assert (UI-state (display how.suceed.query )
                     (relation-asserted how-suceed)
                     (response Teamwork1)
                     (valid-answers Teamwork1 Teamwork2))))   
(defrule determine-fantasy ""

	(logical (theme-choice fantasy))
	
	=>
	
	(assert (UI-state (display dungeon.crawling.query)
					  (relation-asserted dungeon-crawling-answer)
					  (response No)
					  (valid-answers No Yes))))
					  
					  
(defrule determine-fantasy-1 ""

	(logical (dungeon-crawling-answer Yes))
	
	=>
	
	(assert (UI-state (display serious.one.query)
					  (relation-asserted serious-answer)
					  (response No)
					  (valid-answers No Yes))))
					  
(defrule determine-fantasy-2 ""

	(logical (dungeon-crawling-answer No))
	
	=>
	
	(assert (UI-state (display managing.dungeon.query)
					  (relation-asserted dungeon-managing-answer)
					  (response No)
					  (valid-answers No Yes))))
					  
					  
(defrule determine-fantasy-3 ""

	(logical (serious-answer Yes))
	
	=>
	
	(assert (UI-state (display players.query)
					  (relation-asserted players-answer)
					  (response just.two)
					  (valid-answers just.two more.than))))                                                                                                       
;;;****************
;;;* REPAIR RULES *
;;;****************

(defrule star-trek-end ""

   (logical (playing-choice Competetive))
   
   =>

   (assert (UI-state (display "I think your game is: " + star.trek)
                     (state final))))
(defrule star-trek-end2 ""

   (logical (playing-choice Cooperative))
   
   =>

   (assert (UI-state (display "I think your game is: " + star.trek2)
                     (state final))))
(defrule star-wars-end ""

   (logical (grand-adventure Adventure))
   
   =>

   (assert (UI-state (display "I think your game is: " + star.wars)
                     (state final))))                     
(defrule star-wars-end2 ""

   (logical (grand-adventure PewPew))
   
   =>

   (assert (UI-state (display "I think your game is: " + star.wars2)
                     (state final))))                     
(defrule battlestarend ""

   (logical (battlestar-choice Yes))
   
   =>

   (assert (UI-state (display "I think your game is: " + battlestar)
                     (state final))))

(defrule how-epic-end ""

   (logical (how-epic-choice all.day.query))

   =>

   (assert (UI-state (display "I think your game is: " + twilight)
                     (state final))))
                     
(defrule how-epic-end2 ""

   (logical (how-epic-choice work.night.query))

   =>

   (assert (UI-state (display "I think your game is: " + eclipse)
                     (state final))))
(defrule doing-battle-end ""

   (logical (doing-battle-choice inspace))

   =>

   (assert (UI-state (display "I think your game is: " + cosmic.encounter)
                     (state final)))) 
(defrule doing-battle-end2 ""

   (logical (doing-battle-choice galacticcenter))

   =>

   (assert (UI-state (display "I think your game is: " + rex)
                     (state final))))                                          
(defrule doing-battle-end3 ""

   (logical (doing-battle-choice forearth))

   =>

   (assert (UI-state (display "I think your game is: " + conquest)
                     (state final)))) 
(defrule deck-builder-end ""

   (logical (deck-builder-choice Yes))

   =>

   (assert (UI-state (display "I think your game is: " + core.worlds)
                     (state final))))
(defrule living-card-end ""

   (logical (living-game-choice Yes))

   =>

   (assert (UI-state (display "I think your game is: " + android)
                     (state final))))
(defrule living-card-end2 ""

   (logical (living-game-choice No))

   =>

   (assert (UI-state (display "I think your game is: " + galaxy.race)
                     (state final))))
(defrule not-alien-end ""

   (logical (not-alien-choice Athlete))

   =>

   (assert (UI-state (display "I think your game is: " + deadball)
                     (state final)))) 
(defrule not-alien-end2 ""

   (logical (not-alien-choice Galacticcorp))

   =>

   (assert (UI-state (display "I think your game is: " + phantom)
                     (state final))))
(defrule how-suceed-end ""

   (logical (how-suceed Teamwork1))

   =>

   (assert (UI-state (display "I think your game is: " + space.alert)
                     (state final)))) 
(defrule how-suceed-end2 ""

   (logical (how-suceed  Teamwork2))

   =>

   (assert (UI-state (display "I think your game is: " + space.cadets)
                     (state final)))) 
(defrule seriously-end1 ""

   (logical (seriously  bussiness))

   =>

   (assert (UI-state (display "I think your game is: " + merchant.venus)
                     (state final))))
(defrule seriously-end2 ""

   (logical (seriously  giggle))

   =>

   (assert (UI-state (display "I think your game is: " + galaxy.trucker)
                     (state final))))
(defrule survival-end ""

   (logical (survival-choice  survival.of.the.fittest))

   =>

   (assert (UI-state (display "I think your game is: " + city.of.horror)
                     (state final))))
(defrule play-as-zombie-end ""

   (logical (play-as-zombie  all.humans))

   =>

   (assert (UI-state (display "I think your game is: " + zombicide)
                     (state final)))) 
(defrule play-as-zombie-end2 ""

   (logical (play-as-zombie brains))

   =>

   (assert (UI-state (display "I think your game is: " + last.night.on)
                     (state final))))
(defrule card-end ""

   (logical (type-choice card))

   =>

   (assert (UI-state (display "I think your game is: " + resident.evil)
                     (state final))))
(defrule play-with-him-end""

   (logical (play-with-him well.maybe))

   =>

   (assert (UI-state (display "I think your game is: " + mansion.of.madness)
                     (state final)))) 
(defrule epic-end""

   (logical (epic-inwestigation  i.want.epic))

   =>

   (assert (UI-state (display "I think your game is: " + arkham)
                     (state final)))) 
(defrule epic-end2""

   (logical (epic-inwestigation  gateway))

   =>

   (assert (UI-state (display "I think your game is: " + elder.sign)
                     (state final))))  
(defrule card-based1""

   (logical (card-based  ill.crush))

   =>

   (assert (UI-state (display "I think your game is: " + nightfall)
                     (state final))))                                                               
(defrule card-based2""

   (logical (card-based   id.rather.be))

   =>

   (assert (UI-state (display "I think your game is: " + betrayal.at.house)
                     (state final))))     
(defrule determine-fantasy-final-1 ""

   (logical (serious-answer No))
   
   =>

   (assert (UI-state (display "I think your game is: " + munchkin)
                     (state final))))  
					 		 
(defrule determine-fantasy-4 ""

	(logical (dungeon-managing-answer No))
	
	=>
	
	(assert (UI-state (display whole.questing.thing.query)
					  (relation-asserted questing-answer)
					  (response No)
					  (valid-answers No Yes))))
					 
(defrule determine-fantasy-final-2 ""

   (logical (dungeon-managing-answer Yes))
   
   =>

   (assert (UI-state (display "I think your game is: " + dungeon.lords)
                     (state final)))) 
					 
(defrule determine-fantasy-5 ""

	(logical (questing-answer No))
	
	=>
	
	(assert (UI-state (display like.deckbuilder.query)
					  (relation-asserted like-deckbuilder-answer)
					  (response No)
					  (valid-answers No Yes))))

(defrule determine-fantasy-6 ""

	(logical (questing-answer Yes))
	
	=>
	
	(assert (UI-state (display coop.or.comp.query)
					  (relation-asserted coop-comp-answer-2)
					  (response competitive)
					  (valid-answers competitive cooperative coop.backstab ))))					 
					  
(defrule determine-fantasy-7 ""

	(logical (players-answer just.two))
	
	=>
	
	(assert (UI-state (display crush.out.maneuver.query)
					  (relation-asserted crush-out-answer)
					  (response fight)
					  (valid-answers fight maneuver))))					  
					  
(defrule determine-fantasy-8 ""

	(logical (players-answer more.than))
	
	=>
	
	(assert (UI-state (display coop.or.comp.query)
					  (relation-asserted coop-comp-answer)
					  (response cooperative)
					  (valid-answers cooperative competitive))))	

(defrule determine-fantasy-9 ""

	(logical (coop-comp-answer cooperative))
	
	=>
	
	(assert (UI-state (display with.kids.query)
					  (relation-asserted with-kids-answer)
					  (response No)
					  (valid-answers No Yes))))						  
					  
(defrule determine-fantasy-10 ""

	(logical (coop-comp-answer competitive))
	
	=>
	
	(assert (UI-state (display campaign.query)
					  (relation-asserted campaign-answer)
					  (response Yes)
					  (valid-answers Yes just.one.game))))	
					  
(defrule determine-fantasy-final-3 ""

   (logical (crush-out-answer fight))
   
   =>

   (assert (UI-state (display "I think your game is: " + claustrophobia)
                     (state final)))) 		

(defrule determine-fantasy-final-4 ""

   (logical (crush-out-answer maneuver))
   
   =>

   (assert (UI-state (display "I think your game is: " + dungeon.twiser)
                     (state final)))) 					  					 
					 
(defrule determine-fantasy-final-5 ""

   (logical (with-kids-answer Yes))
   
   =>

   (assert (UI-state (display "I think your game is: " + mice.and.mystics)
                     (state final)))) 
					 
(defrule determine-fantasy-final-6 ""

   (logical (with-kids-answer No))
   
   =>

   (assert (UI-state (display "I think your game is: " + dungeon.and.dragons)
                     (state final)))) 
					 
(defrule determine-fantasy-final-7 ""

   (logical (campaign-answer Yes))
   
   =>

   (assert (UI-state (display "I think your game is: " + descent)
                     (state final)))) 
				
(defrule determine-fantasy-final-8 ""

   (logical (campaign-answer just.one.game))
   
   =>

   (assert (UI-state (display "I think your game is: " + dungeon.run)
                     (state final)))) 
					 
					 
(defrule determine-fantasy-11 ""

	(logical (coop-comp-answer-2 competitive))
	
	=>
	
	(assert (UI-state (display mind.getting.trounced.query)
					  (relation-asserted mind-answer)
					  (response strategy.matters)
					  (valid-answers strategy.matters experience))))
					  
(defrule determine-fantasy-12 ""

	(logical (coop-comp-answer-2 cooperative))
	
	=>
	
	(assert (UI-state (display board.or.card.query)
					  (relation-asserted board-or-card-answer)
					  (response boards)
					  (valid-answers boards cards))))
					  
					  
(defrule determine-fantasy-final-9 ""

   (logical (coop-comp-answer-2 coop.backstab))
   
   =>

   (assert (UI-state (display "I think your game is: " + shadows.over)
                     (state final)))) 
					 
(defrule determine-fantasy-final-10 ""

   (logical (board-or-card-answer boards))
   
   =>

   (assert (UI-state (display defenders.realm)
                     (state final)))) 
					 
(defrule determine-fantasy-final-11 ""

   (logical (board-or-card-answer cards))
   
   =>

   (assert (UI-state (display "I think your game is: " + lord.rings.card)
                     (state final)))) 
					 
(defrule determine-fantasy-final-12 ""

   (logical (mind-answer strategy.matters))
   
   =>

   (assert (UI-state (display "I think your game is: " + mage.knight)
                     (state final)))) 
					 
(defrule determine-fantasy-13 ""

	(logical (mind-answer experience))
	
	=>
	
	(assert (UI-state (display storytelling.query)
					  (relation-asserted storytelling-answer)
					  (response Yes)
					  (valid-answers Yes not.as.much.as.combat))))
					  
					  
(defrule determine-fantasy-final-13 ""

   (logical (storytelling-answer Yes))
   
   =>

   (assert (UI-state (display "I think your game is: " + tales.arabian)
                     (state final)))) 
					 
(defrule determine-fantasy-final-14 ""

   (logical (storytelling-answer not.as.much.as.combat))
   
   =>

   (assert (UI-state (display "I think your game is: " + talisman)
                     (state final)))) 
					 
(defrule determine-fantasy-14 ""

	(logical (like-deckbuilder-answer Yes))
	
	=>
	
	(assert (UI-state (display comp.deck.builder.query)
					  (relation-asserted comp-deck-answer)
					  (response competitive)
					  (valid-answers competitive cooperative))))

(defrule determine-fantasy-final-15 ""

   (logical (comp-deck-answer competitive))
   
   =>

   (assert (UI-state (display "I think your game is: " + thunderstone)
                     (state final)))) 
					 
(defrule determine-fantasy-final-16 ""

   (logical (comp-deck-answer cooperative))
   
   =>

   (assert (UI-state (display "I think your game is: " + rune.age)
                     (state final)))) 
					 
(defrule determine-fantasy-15 ""

	(logical (like-deckbuilder-answer No))
	
	=>
	
	(assert (UI-state (display lord.rings.query)
					  (relation-asserted lord-rings-answer)
					  (response Yes)
					  (valid-answers Yes No))))
					  
(defrule determine-fantasy-final-17 ""

   (logical (lord-rings-answer Yes))
   
   =>

   (assert (UI-state (display "I think your game is: " + war.of.ring)
                     (state final)))) 
					 
(defrule determine-fantasy-16 ""

	(logical (lord-rings-answer No))
	
	=>
	
	(assert (UI-state (display castle.defense.query)
					  (relation-asserted castle-defense-answer)
					  (response sounds.fun)
					  (valid-answers sounds.fun not.for.me))))
					  
(defrule determine-fantasy-17 ""

	(logical (castle-defense-answer sounds.fun))
	
	=>
	
	(assert (UI-state (display coop.or.comp.query)
					  (relation-asserted coop-comp-answer-3)
					  (response competitive)
					  (valid-answers competitive cooperative))))
					  
(defrule determine-fantasy-final-18 ""

   (logical (coop-comp-answer-3 competitive))
   
   =>

   (assert (UI-state (display "I think your game is: " + dragon.rampage)
                     (state final))))
					 
(defrule determine-fantasy-final-19 ""

   (logical (coop-comp-answer-3 cooperative))
   
   =>

   (assert (UI-state (display "I think your game is: " + castle.panic)
                     (state final))))
					 
(defrule determine-fantasy-18 ""

	(logical (castle-defense-answer not.for.me))
	
	=>
	
	(assert (UI-state (display conquest.query)
					  (relation-asserted conquest-answer)
					  (response Yes)
					  (valid-answers Yes No))))
					  
(defrule determine-fantasy-19 ""

	(logical (conquest-answer Yes))
	
	=>
	
	(assert (UI-state (display epic.query)
					  (relation-asserted epic-answer)
					  (response gotta.be.big)
					  (valid-answers gotta.be.big keep.it.quick))))
					  
(defrule determine-fantasy-final-20 ""

   (logical (epic-answer gotta.be.big))
   
   =>

   (assert (UI-state (display "I think your game is: " + runewars)
                     (state final))))
					  
(defrule determine-fantasy-final-21 ""

   (logical (epic-answer keep.it.quick))
   
   =>

   (assert (UI-state (display "I think your game is: " + small.world)
                     (state final))))
					 
(defrule determine-fantasy-20 ""

	(logical (conquest-answer No))
	
	=>
	
	(assert (UI-state (display everyday.life.query)
					  (relation-asserted everyday-life-answer)
					  (response business)
					  (valid-answers business relax.after annihilating))))
					  

(defrule determine-fantasy-final-22 ""

   (logical (everyday-life-answer business))
   
   =>

   (assert (UI-state (display "I think your game is: " + dungeon.petz)
                     (state final))))		

(defrule determine-fantasy-final-23 ""

   (logical (everyday-life-answer relax.after))
   
   =>

   (assert (UI-state (display "I think your game is: " + red.dragon.inn)
                     (state final))))	

(defrule determine-fantasy-final-24 ""

   (logical (everyday-life-answer annihilating))
   
   =>

   (assert (UI-state (display "I think your game is: " + mage.wars)
                     (state final))))	                                                                                                                                                                                                                                                                                                                         
;;;*************************
;;;* GUI INTERACTION RULES *
;;;*************************

(defrule ask-question

   (declare (salience 5))
   
   (UI-state (id ?id))
   
   ?f <- (state-list (sequence $?s&:(not (member$ ?id ?s))))
             
   =>
   
   (modify ?f (current ?id)
              (sequence ?id ?s))
   
   (halt))

(defrule handle-next-no-change-none-middle-of-chain

   (declare (salience 10))
   
   ?f1 <- (next ?id)

   ?f2 <- (state-list (current ?id) (sequence $? ?nid ?id $?))
                      
   =>
      
   (retract ?f1)
   
   (modify ?f2 (current ?nid))
   
   (halt))

(defrule handle-next-response-none-end-of-chain

   (declare (salience 10))
   
   ?f <- (next ?id)

   (state-list (sequence ?id $?))
   
   (UI-state (id ?id)
             (relation-asserted ?relation))
                   
   =>
      
   (retract ?f)

   (assert (add-response ?id)))   

(defrule handle-next-no-change-middle-of-chain

   (declare (salience 10))
   
   ?f1 <- (next ?id ?response)

   ?f2 <- (state-list (current ?id) (sequence $? ?nid ?id $?))
     
   (UI-state (id ?id) (response ?response))
   
   =>
      
   (retract ?f1)
   
   (modify ?f2 (current ?nid))
   
   (halt))

(defrule handle-next-change-middle-of-chain

   (declare (salience 10))
   
   (next ?id ?response)

   ?f1 <- (state-list (current ?id) (sequence ?nid $?b ?id $?e))
     
   (UI-state (id ?id) (response ~?response))
   
   ?f2 <- (UI-state (id ?nid))
   
   =>
         
   (modify ?f1 (sequence ?b ?id ?e))
   
   (retract ?f2))
   
(defrule handle-next-response-end-of-chain

   (declare (salience 10))
   
   ?f1 <- (next ?id ?response)
   
   (state-list (sequence ?id $?))
   
   ?f2 <- (UI-state (id ?id)
                    (response ?expected)
                    (relation-asserted ?relation))
                
   =>
      
   (retract ?f1)

   (if (neq ?response ?expected)
      then
      (modify ?f2 (response ?response)))
      
   (assert (add-response ?id ?response)))   

(defrule handle-add-response

   (declare (salience 10))
   
   (logical (UI-state (id ?id)
                      (relation-asserted ?relation)))
   
   ?f1 <- (add-response ?id ?response)
                
   =>
      
   (str-assert (str-cat "(" ?relation " " ?response ")"))
   
   (retract ?f1))   

(defrule handle-add-response-none

   (declare (salience 10))
   
   (logical (UI-state (id ?id)
                      (relation-asserted ?relation)))
   
   ?f1 <- (add-response ?id)
                
   =>
      
   (str-assert (str-cat "(" ?relation ")"))
   
   (retract ?f1))   

(defrule handle-prev

   (declare (salience 10))
      
   ?f1 <- (prev ?id)
   
   ?f2 <- (state-list (sequence $?b ?id ?p $?e))
                
   =>
   
   (retract ?f1)
   
   (modify ?f2 (current ?p))
   
   (halt))
   
