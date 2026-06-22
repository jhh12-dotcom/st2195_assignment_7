# st2195_assignment_7

This repository contains an R data visualization script designed to analyze and explore the demographics and survival patterns of passengers aboard the Titanic. 

Following the assignment guidelines, the raw dataset (`titanic.csv`) is **not** committed to this repository. Instructions for manually downloading the dataset and reproducing this environment are detailed below.

---

## Dataset Setup Instructions

To execute the analysis script successfully, you must manually source and prepare the dataset file:

1. **Download:** Navigate to Kaggle and download the official **Titanic - Machine Learning from Disaster** dataset.
2. **Extraction:** Unzip the downloaded folder and extract **only** the `train.csv` file.
3. **Renaming:** Rename `train.csv` strictly to `titanic.csv`.
4. **Placement:** Place the `titanic.csv` file directly into the root directory of this repository (the same folder containing your R script).

---

## Repository Contents

* `assignment7.R`: The complete R script containing all data processing and `ggplot2` visualization pipelines.
* `free_passengers.csv`: An exported output table identifying the passengers onboard who did not pay a travel fare.
* `README.md`: Project documentation and analysis summaries.

---

## Visualizations Generated

The `assignment7.R` script executes a comprehensive exploratory data analysis by producing the following charts sequentially:

1. **Passenger Demographics:** A series of standalone bar charts detailing the overall distribution of passenger gender, ticket classes (1st, 2nd, 3rd), and survival outcomes.
2. **Age Profiles:** A fine-grained histogram capturing the passenger age distribution, coupled with two comparative boxplots examining age distributions across ticket classes and survival status.
3. **Financial Metrics:** A fare distribution histogram, along with logic calculating the exact number of individuals traveling free of charge.
4. **Socioeconomic Family Structures:** A specialized boxplot layered with jittered data points to visually communicate family sizes across distinct ticket classes.
5. **Stratified Survival Matrix:** A series of stacked bar charts evaluating how survival proportions fluctuated under the combined influence of passenger gender and ticket class.
6. **Demographic Intersections (Violin Charts):** 
   * A violin chart mapping survival density distributions against passenger age and gender.
   * A violin chart mapping survival density distributions against passenger age and ticket class.

---

## Key Analytical Insights

### 1. The "Free" Passenger Phenomenon (Question 3)
The data shows a handful of passengers traveling with a recorded `Fare` of `0`. Historical records reveal these individuals were not standard ticket holders. Instead, they were predominantly:
* **White Star Line Employees:** Members of the ship's "guarantee group" (including shipbuilders, engineers, and architects like Thomas Andrews sent to observe the voyage), Marconi wireless operators, and off-duty crew.
* **Corporate Guests:** High-ranking company executives or guests of the shipping line who were comped passage (such as J. Bruce Ismay).

### 2. Main Variables and Survival Associations
An evaluation of the generated plots highlights distinct demographic trends:

* **The Gender Premium ("Women and Children First"):** Gender is the single most defining predictor of survival. Females maintained an overwhelmingly higher survival percentage than males across every individual ticket class. The male violin plot exhibits heavy density shifts toward the "Died" spectrum for young and middle-aged adults.
* **Socioeconomic Stratification:** Ticket class played a critical role in safety access. 1st Class passengers experienced much higher survival rates than 3rd Class passengers. While wealth could not perfectly guarantee safety, it heavily tilted the probabilities.
* **Age Discrepancies:** Children (particularly infants and young children in 1st and 2nd class) achieved very favorable survival densities. Conversely, being an older passenger in 3rd class carried the highest statistical risk, as older age groups in 1st class retained significantly wider survival footprints.
* **Family Size Patterns:** 3rd class passengers contained the widest variation and largest extremes of family sizes (large immigrant families traveling together). 1st and 2nd class tickets were heavily dominated by individuals or small nuclear pairings (1 to 3 members).

<img width="902" height="515" alt="Screenshot 2026-06-22 at 10 08 33 AM" src="https://github.com/user-attachments/assets/54345692-bc2a-44c0-8974-9e1cf19b8785" />
