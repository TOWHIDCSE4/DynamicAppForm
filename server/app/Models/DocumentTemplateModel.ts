import BaseModel from './BaseModel'

class DocumentTemplateModel extends BaseModel {
  static tableName = "document_templates"

  //fields
  id: number;
  formName: string;
  content: Array<string>;
  locale:string;
  documentId: number;
  updatedDate: Date;
  createdBy: number;
  updatedBy: number;
}
export default DocumentTemplateModel
