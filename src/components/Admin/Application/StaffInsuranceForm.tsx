import React, { useState } from "react";
import { useForm, FormProvider } from "react-hook-form";
import { CommonForm } from "./CommonForm";
import schemaData from "../../../../config/Application_schema.json";
import useBaseHook from "@src/hooks/BaseHook";
import { Button, Row, Col } from "antd";

const DynamicFormPage = () => {
  const { t } = useBaseHook();

  const [formJosnSchema, setFormJosnSchema] = useState(schemaData);

  const methods = useForm({
    mode: "all",
  });
  const { handleSubmit } = methods;

  const onSubmit = (data: any) => {
    console.log("form data", data);
  };
  return (
    <div className="common-form-container">
      <FormProvider {...methods}>
        <form onSubmit={handleSubmit(onSubmit)}>
          {Object.values(formJosnSchema?.schema).map((fieldValue, i) => {
            return (
              <div key={i}>
                <h2>{fieldValue?.title}</h2>
                <Row className="field-container-one-third">
                  {fieldValue?.fields.map((field, k) => {
                    return (
                      <Col key={k} xs="field.Col.xs" lg="field.Col.lg" order={field.position}>
                        <CommonForm formField={field} />
                      </Col>
                    );
                  })}
                </Row>
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
  );
};

export default DynamicFormPage;

// className={` ${field.inputType === "file"? "field-item-file":"field-item"}`}
