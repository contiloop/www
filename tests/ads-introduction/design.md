# QE-guided Active Data Selection paper

## 1 Overview
- Type: research paper
- Reader: reviewers at a machine-translation or NLP conference, judging whether the problem, the gap and the method are well motivated and the claims supported
- Topic: efficient selection of translation training data under a limited Teacher LLM budget
- Message: the Introduction establishes the research question of which source sentences should be selected under a limited teacher annotation budget, then introduces QE-guided Active Data Selection (ADS) as the proposed method, which prioritizes low-QE sentences (replaces: the paper answers which sentences deserve the teacher's budget, by selecting low-QE sentences)
    author: The Introduction should establish the research question of which source sentences should be selected under a limited teacher annotation budget, and then introduce QE-guided Active Data Selection (ADS) as the proposed method, which prioritizes low-QE sentences.
- Progression: existing translation services have cost and security problems → a small, locally deployable, domain-specific translation model must be developed → training it needs parallel data, which Teacher LLMs can supply but not for the whole dataset → which sentences should receive the teacher's budget → QE-guided ADS, which prioritizes low-QE sentences → experiments compare ADS with baselines → the conclusion answers the research question

## 2 Structure and section plans
1. Introduction — advances in translation technology; cost and security issues with existing services; need for small, locally deployable translation models; difficulties in obtaining parallel data; potential of Teacher LLMs and their cost constraints; research question: which sentences should be selected?; introduction of QE-guided ADS
2. Related Work — domain-specific translation research; Teacher LLM-based translation data generation; Active Learning and data selection; relationship between prior work and this study
3. Method — overall ADS framework; student translation generation and QE evaluation; low-QE prioritization and length stratification; Teacher translation generation and student training
4. Experiments — experimental setup and evaluation methods; comparison baselines; main performance results; analysis of results
5. Conclusion — answer to the research question; main findings and research contributions

## 3 Detailed logic
### Introduction
C1 (description) Translation technology has advanced.
    author: 번역 기술은 발전했다.
  → C2 by contrast
C2 (judgment) However, existing services have cost and security issues.
    author: 그러나 기존 서비스를 사용하기에는 비용·보안 문제가 있다.
  → C3 by consequence, holds when the model can run locally (로컬에서 실행할 수 있는)
C3 (need) Therefore, small, locally deployable, domain-specific translation models are needed.
    author: 그러므로 로컬에서 실행할 수 있는 작은 도메인 특화 번역 모델을 개발할 필요가 있다.
  → C4 by condition
C4 (need) Training such models requires parallel data.
    author: 그런데 이러한 모델을 학습하려면 병렬 데이터가 필요하다.
  → C5 by contrast
C5 (judgment) Constructing parallel data manually is difficult.
    author: 병렬 데이터를 사람에게 만들도록 하기 어렵다.
  → C6 by consequence
C6 (need) An alternative source of supervision is needed.
    author: 따라서 다른 supervision 공급원을 찾아야 한다.
  → C7 by cause
C7 (description) Teacher LLMs can provide high-quality supervision.
    author: Teacher LLM이 양질의 번역 supervision을 제공할 수 있다.
    author: Teacher LLM은 양질의 번역 supervision을 제공할 수 있다.
  → C8 by contrast
C8 (judgment) Applying them to the entire dataset is expensive.
    author: 하지만 전체 데이터에 사용하기에는 비용이 크다.
    author: 그러나 모든 문장을 teacher에게 맡기기에는 비용이 크다.
  → C9 by contrast
C9 (description) Even a small amount of high-quality data can improve performance.
    author: 그런데 소량의 고품질 데이터만으로도 성능을 개선할 수 있다.
    author: 소량의 고품질 병렬 데이터만으로도 student의 번역 성능을 개선할 수 있다.
  → C10 by consequence, holds when the teacher budget is limited (제한된 비용으로)
C10 (question) Which sentences should receive the teacher's annotation budget?
    author: 그렇다면 어떤 문장에 teacher의 비용을 써야 하는가?
    author: 그렇다면 제한된 비용으로 어떤 문장을 teacher에게 맡겨야 하는가?
  → C11 by question/answer
C11 (proposal) We propose QE-guided ADS.
    author: 이를 해결하기 위해 QE-guided Active Data Selection(ADS)을 제안한다.
  → C12 by condition
C12 (description) ADS prioritizes low-QE sentences.
    author: ADS는 student의 번역을 QE 모델로 평가하고, QE 점수가 낮은 문장을 우선 선택한다.

## 4 Emphasis and wording
### Introduction
- Condition that must survive: the model in C3 can run locally (로컬에서 실행할 수 있는); it is what carries the cost and security problems of C2 to the need in C3
- Emphasize: C3 as a need to develop the model, not as an option among others
- Distinction: "offers an alternative" → "must be developed" (the need in C3)
- Rejected addition: a judgment that small models are useful for domain-specific translation (rejected text: 도메인 특화 번역에는 작은 모델이 유용하지만), in the draft or in any explanation of the draft; the record has no usefulness claim, only the need in C3
- Rejected addition: a justification of low-QE selection placed between the research question (C10) and the introduction of ADS (C11); rejected text:
  "If the student already translates a segment well, obtaining another translation of that segment may offer limited additional benefit."
  "In contrast, segments that the student translates poorly may reveal weaknesses that teacher-provided corrections could help address."
  "However, poor translation quality does not necessarily imply greater training value. Whether prioritizing such segments leads to better translation performance than alternative selection strategies remains an empirical question."
- Rejected logic: research question → well-translated sentences gain little from more supervision → poorly translated sentences expose weaknesses → low quality does not guarantee training value, so the benefit must be verified empirically → ADS

## 5 Status
document: type agreed, reader-and-topic agreed, structure agreed
sections:
  Introduction: level logic, draft none
  Related Work: level plan, draft none
  Method: level plan, draft none
  Experiments: level plan, draft none
  Conclusion: level plan, draft none
last worked on: Introduction
open questions: none
proposals:
  - Introduction, detailed logic, the relations whose Korean line carries no connective: C4 → C5 by contrast, C6 → C7 by cause, C11 → C12 by condition, alternatives: keep as written / the author names each relation, recommended keep as written
