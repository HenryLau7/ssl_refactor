from pathlib import Path

ROOT = Path(__file__).parent.parent.resolve()

BASE_DIR = ROOT / "self_supervision"
DATA_DIR = "/home/aiscuser/"
TRAINING_FOLDER = ROOT / "self_supervision" / "trained_models"
RESULTS_FOLDER = ROOT / "self_supervision" / "results"
OOD_FOLDER = ROOT / "self_supervision" / "OOD"
MULTIMODAL_FOLDER = ROOT / "self_supervision" / "neurips_multimodal"