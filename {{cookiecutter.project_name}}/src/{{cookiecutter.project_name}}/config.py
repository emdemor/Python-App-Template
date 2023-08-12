from dotenv import load_dotenv
from pydantic_settings import BaseSettings
from pydantic import Field


class Config(BaseSettings):
    ENVVAR: str = Field(default="default-env-var", env="ENVVAR")


load_dotenv()
config = Config()
