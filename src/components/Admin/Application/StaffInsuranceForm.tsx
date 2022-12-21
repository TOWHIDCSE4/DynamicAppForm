// import React from 'react'
// import { Form, Input} from 'antd';
// import useBaseHook from '@src/hooks/BaseHook'

// const StaffInsuranceForm = () => {

//   const { t } = useBaseHook();

//   return <>
//     <Form>
//         <Form.Item
//         label={t("pages:application.staffInsuranceForm.firstName")}
//         name="firstName"
//         rules={[
//             { required: true, message: t('messages:form.required', { name: t('pages:application.staffInsuranceForm.firstName') }) },
//             { whitespace: true, message: t('messages:form.required', { name: t('pages:application.staffInsuranceForm.firstName') }) },
//             { max: 255, message: t('messages:form.maxLength', { name: t('pages:application.staffInsuranceForm.firstName'), length: 255 }) }
//         ]}
//         >
//         <Input placeholder={t("pages:application.staffInsuranceForm.firstName")} />
//         </Form.Item>
//     </Form>

//   </>
// }

// export default StaffInsuranceForm

import React, { useState } from "react";
import { useForm, FormProvider } from "react-hook-form";
import { CommonForm } from "./CommonForm";
import schema from "../../../../config/Application_schema.json";
import useBaseHook from "@src/hooks/BaseHook";
import { Button } from "antd";

const DynamicFormPage = () => {
  const { t } = useBaseHook();

  const [formFields, setFromFields] = useState(schema);
  const [{}] = formFields.schema;
  const methods = useForm({
    mode: "all",
  });
  const { handleSubmit } = methods;

  const onSubmit = (data: any) => {
    console.log("form data", data);
  };
  return (
    <div className="">
      <div className="">
        <FormProvider {...methods}>
          <form onSubmit={handleSubmit(onSubmit)}>
            {formFields.schema.map((field, i) => {
              return (
                <div className="" key={i}>
                  <div className="">
                    <CommonForm formField={field} />
                  </div>
                </div>
              );
            })}
            <div className="">
              <Button type="primary" size="large" htmlType="submit" className="">
                Submit
              </Button>
            </div>
          </form>
        </FormProvider>
      </div>
    </div>
  );
};

export default DynamicFormPage;
