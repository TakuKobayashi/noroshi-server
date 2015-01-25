json.set! "mstGimmick" do
  mst_gimmicks = Mst::Gimmick.all.to_a
  json.array!(mst_gimmicks) do |mst_gimmick|
    json.id mst_gimmick.id
    json.name mst_gimmick.name
    json.category mst_gimmick.category
  end
end
json.set! "mstStage" do
  mst_stages = Mst::Stage.all.to_a
  json.array!(mst_stages) do |mst_stage|
    json.id mst_stage.id
    json.name mst_stage.name
    json.number mst_stage.number
    json.member_count mst_stage.member_count
  end
end
json.set! "mstStageGimmick" do
  mst_stage_gimmicks = Mst::StageGimmick.all.to_a
  json.array!(mst_stage_gimmicks) do |mst_stage_gimmick|
    json.id mst_stage_gimmick.id
    json.mst_stage_id mst_stage_gimmick.mst_stage_id
    json.mst_gimmick_id mst_stage_gimmick.mst_gimmick_id
    json.amount mst_stage_gimmick.amount
  end
end