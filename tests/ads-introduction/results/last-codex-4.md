Saved the Introduction to [draft.md](/Users/inertia/Desktop/www/tests/ads-introduction/draft.md). Kept C4 → C5 as contrast, C6 → C7 as cause, and C11 → C12 as condition, and cleared the pending proposal in [design.md](/Users/inertia/Desktop/www/tests/ads-introduction/design.md).

Translation technology has advanced. However, existing translation services have cost and security issues. Therefore, small, locally deployable, domain-specific translation models must be developed.

Training these models requires parallel data. Yet constructing parallel data manually is difficult. An alternative source of supervision is therefore needed. Teacher large language models (LLMs) can meet this need by providing high-quality translation supervision. However, using them for the entire dataset is expensive. Nevertheless, even a small amount of high-quality parallel data can improve a student model’s translation performance.

Under a limited teacher annotation budget, which source sentences should be selected for teacher translation? To answer this question, we propose QE-guided Active Data Selection (ADS). In ADS, a quality estimation (QE) model evaluates the student’s translations, and sentences with low QE scores are prioritized for selection.

The self-check passed without changes. The independent check found no mismatches. All six mechanical checks passed using the script’s checking code with an in-memory mapping. The Korean explanation below was also checked against `design.md`.

한국어 설명:

번역 기술은 발전했지만, 기존 번역 서비스에는 비용과 보안 문제가 있습니다. 따라서 로컬에서 실행할 수 있는 작은 도메인 특화 번역 모델을 개발할 필요가 있다는 데서 출발합니다.

이런 모델을 학습하려면 병렬 데이터가 필요하지만, 사람이 직접 만들기는 어렵습니다. 따라서 다른 학습 신호 공급원이 필요하며, Teacher LLM은 양질의 번역 supervision을 제공할 수 있습니다. 그러나 전체 데이터를 Teacher LLM으로 번역하는 데는 비용이 많이 듭니다. 한편, 소량의 고품질 병렬 데이터만으로도 student의 번역 성능을 개선할 수 있습니다.

여기서 “제한된 teacher 주석 예산으로 어떤 원문 문장을 선택해야 하는가?”라는 연구 질문을 제시합니다. 이어서 제안하는 방법인 QE-guided ADS를 소개합니다. ADS는 student의 번역을 QE 모델로 평가하고, QE 점수가 낮은 문장을 우선 선택합니다.