# This files contains your custom actions which can be used to run
# custom Python code.
#
# See this guide on how to implement these action:
# https://rasa.com/docs/rasa/custom-actions


# This is a simple example for a custom action which utters "Hello World!"

from typing import Any, Text, Dict, List

from rasa_sdk import Action, Tracker
from rasa_sdk.events import SlotSet, EventType
from rasa_sdk.executor import CollectingDispatcher
import smtplib
from email.mime.multipart import MIMEMultipart
from email.mime.text import MIMEText
from email.mime.application import MIMEApplication


class ActionSubmitEmail(Action):
    def name(self) -> Text:
        return "action_submit_email"

    def run(
        self,
        dispatcher,
        tracker: Tracker,
        domain: "DomainDict",
    ) -> List[Dict[Text, Any]]:

        SendEmail(
            tracker.get_slot("email"),
            tracker.get_slot("passport")
            # tracker.get_slot("message")
        )
        dispatcher.utter_message(
            template="utter_details_thanks",
            Passport=tracker.get_slot("passport"),
            Email=tracker.get_slot("email"))
        # "Thanks for providing the details. We have sent you a mail at {}".format(tracker.get_slot("email")))
        return []


def SendEmail(toaddr, passport):

    fromaddr = "athenaxbot@gmail.com"
    # instance of MIMEMultipart
    msg = MIMEMultipart()

    # storing the senders email address
    msg['From'] = fromaddr

    # storing the receivers email address
    msg['To'] = toaddr

    # storing the subject
    msg['Subject'] = "YalemZewd hotel - folio for your stay"

    # string to store the body of the mail
    body = "Attached is the folio for your stay" + \
        "- Passport Number - " + str(passport)

    pdf = MIMEApplication(open('123.pdf', 'rb').read())

    pdf.add_header('Content-Disposition', 'attachment', filename='123.pdf')
    msg.attach(pdf)

    # attach the body with the msg instance
    msg.attach(MIMEText(body, 'plain'))

    # open the file to be sent
    # filename = "/home/ashish/Downloads/webinar_rasa2_0.png"
    # attachment = open(filename, "rb")
    #
    # # instance of MIMEBase and named as p
    # p = MIMEBase('application', 'octet-stream')
    #
    # # To change the payload into encoded form
    # p.set_payload((attachment).read())
    #
    # # encode into base64
    # encoders.encode_base64(p)
    #
    # p.add_header('Content-Disposition', "attachment; filename= %s" % filename)
    #
    # # attach the instance 'p' to instance 'msg'
    # msg.attach(p)

    # creates SMTP session
    s = smtplib.SMTP('smtp.gmail.com', 587)

    # start TLS for security
    s.starttls()

    # Authentication
    try:
        s.login(fromaddr, "athena@xellerent")

        # Converts the Multipart msg into a string
        text = msg.as_string()

        # sending the mail
        s.sendmail(fromaddr, toaddr, text)
    except:
        print("An Error occured while sending email.")
    finally:
        # terminating the session
        s.quit()
