# prepare LLaMA-Factory
git clone --depth 1 https://github.com/hiyouga/LLaMA-Factory.git
cd LLaMA-Factory
pip install -e ".[torch,metrics]"

# prepare data
pip install -U huggingface_hub
export HF_ENDPOINT=https://hf-mirror.com
huggingface-cli download --resume-download NovaSky-AI/Sky-T1_preference_data_10k --local-dir ./data/NovaSky-AI/Sky-T1_preference_data_10k

# prepare model
pip install -U huggingface_hub
export HF_ENDPOINT=https://hf-mirror.com
mkdir ./models
huggingface-cli download --resume-download deepseek-ai/DeepSeek-R1-Distill-Qwen-7B --local-dir ./models/DeepSeek-R1-Distill-Qwen-7B

# train
llamafactory-cli train workdir/DeepSeek-R1-Distill-Qwen-7B.yaml