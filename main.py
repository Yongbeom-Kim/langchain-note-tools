import getpass
import os
import dotenv

# os.environ["ANTHROPIC_API_KEY"] = getpass.getpass()

dotenv.load_dotenv()

from langchain_anthropic import ChatAnthropic

model = ChatAnthropic(model="claude-3-sonnet-20240229")

from langchain_core.output_parsers import StrOutputParser
from langchain_core.prompts import ChatPromptTemplate

prompt = ChatPromptTemplate.from_template("tell me a short joke about {topic}")
output_parser = StrOutputParser()

chain = prompt | model | output_parser

print(chain.invoke({"topic": "ice cream"}))