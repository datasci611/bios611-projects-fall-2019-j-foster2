.PHONY: all
all: ./results/client_entry_exit_annotated.txt ./results/race_v_time_spent.pdf ./results/gender_v_time_spent.pdf ./results/gender_v_time_spent_race.pdf ./results/vet-status_v_time_spent_race.pdf \
	./results/annual_shelter_entries_unemployment.pdf clean

./results/vet-status_v_time_spent_race.pdf: ./scripts/veteran_v_time-in-shelter.py ./results/client_entry_exit_annotated.txt
	python ./scripts/veteran_v_time-in-shelter.py

./results/gender_v_time_spent_race.pdf: ./scripts/gender_race_v_time-in-shelter.py ./results/client_entry_exit_annotated.txt
	python ./scripts/gender_race_v_time-in-shelter.py

./results/gender_v_time_spent.pdf: ./scripts/gender_v_time-in-shelter.py ./results/client_entry_exit_annotated.txt
	python ./scripts/gender_v_time-in-shelter.py

./results/race_v_time_spent.pdf: ./scripts/race_v_time-in-shelter.py ./results/client_entry_exit_annotated.txt
	python ./scripts/race_v_time-in-shelter.py

./results/client_entry_exit_annotated.txt ./scripts/race_v_time-in-shelter.py ./scripts/gender_v_time-in-shelter.py ./scripts/gender_race_v_time-in-shelter.py ./scripts/veteran_v_time-in-shelter.py:
	jupyter nbconvert --to notebook --execute ./scripts/proj3_data_wrangle.ipynb

./results/annual_shelter_entries_unemployment.pdf: ./scripts/len_stay_unemploy.R ./data/durham_chapel_hill_unemployment_rate.txt ./results/client_entry_exit_annotated.txt
	Rscript ./scripts/len_stay_unemploy.R

clean:
	@echo "Cleaning files..."
	rm ./scripts/proj3_data_wrangle.nbconvert.ipynb
	rm ./Rplots.pdf
