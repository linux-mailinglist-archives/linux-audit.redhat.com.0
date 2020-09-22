Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 6A6EC2743DF
	for <lists+linux-audit@lfdr.de>; Tue, 22 Sep 2020 16:13:41 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-581-5ZYNfRvaM--8aDDWx9y4PQ-1; Tue, 22 Sep 2020 10:13:37 -0400
X-MC-Unique: 5ZYNfRvaM--8aDDWx9y4PQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0B2501091070;
	Tue, 22 Sep 2020 14:13:31 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7CA845DEC7;
	Tue, 22 Sep 2020 14:13:28 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id F108C18A1996;
	Tue, 22 Sep 2020 14:13:25 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08MEDGjV029240 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 22 Sep 2020 10:13:16 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 0E9CB202450E; Tue, 22 Sep 2020 14:13:16 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 088A92022788
	for <linux-audit@redhat.com>; Tue, 22 Sep 2020 14:13:13 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7881C18AE949
	for <linux-audit@redhat.com>; Tue, 22 Sep 2020 14:13:13 +0000 (UTC)
Received: from sonic305-21.consmr.mail.ne1.yahoo.com
	(sonic305-21.consmr.mail.ne1.yahoo.com [66.163.185.147]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-266-mlITlRGANyKS1JlWQN-fSw-1;
	Tue, 22 Sep 2020 10:13:09 -0400
X-MC-Unique: mlITlRGANyKS1JlWQN-fSw-1
X-YMail-OSG: GaaNhdsVM1n7KxYzzpB9Roo6wBXdiXJQoXAlJ3tC69emWxFU9uOVH20y1Wvxq3J
	Zh1p_qWytyY43QktE_XG674zPqBMFzZT1e6U5oY3JZFQpA8YggUO25zVzyIn0ehvf.IDwcrQO2p9
	feocISYoLzqRdRg4gZN1EBS0aLk3fY3PgwMWXbiSiwS_v5vfv6eoYoylkhVT9Az0oevWSV72eCay
	4Q1Tz.yMGETv0FpF0z2KIbiyVFtZ.3ULdK3eDqyXKM5f.ZsE0wt9SdewCsOBSNxe1Q.8ht12sf.X
	jROlk7Foq35G2t_Bj_Iv0SrOPR698TkbrI3FmK4LKHrMmhssEQxgz2W4rT6QnnJYKNsIW0IJbMS.
	4qcH_NTBkyY7YBMbQF5Zc1JtPj_R9UdHZL4mldmDqIM7k2AGSRfMRzXTZjvyZR9QzrQEg1d8VFmm
	.17tlAxigUMtOq4lWVhZRP5NpILbJzoFmAl9zgOnClUoocK6BIRbXoPBGwb7QPJwGWXL85RGiFBv
	ZelZXDghpGn3YRNm2rE.CqTFrW.D4BoMP7Wz9YnffDZQPuL4hyjXiOeEe6tc9Xc_ag7kTEVAWTP7
	d0UZDVJWMZDCOEVhg1Jx3TdkFvL5cY.sHFVGfCbQbwmBR41UfWH92Xcc7MjYuJhaRJVu6WI.cWwV
	Xco7fX4zIz7hLLOgDbMgMX9a3L7RZe8yBKpf.Lh5E_EdPo6n1W7_MyRB1yg01tRDUE6lLsQOaqn4
	9zDqqjUtr1i6qHi1Fjn1s4hH5BCFvFe6v0iggEmAWo029DBkMCIIEnRY18QedFWAsPp4vh.jhXTq
	LpsSdqsDp_NXoICpZYjwrqDmgTyw3CJJQ6mxX96P6g4hSQFguQM.EJV58XIb7Yf_8JZ6Nho8YsfA
	._KZL43gKIQ9zDKD0GyguIeFK.gzQd1FrLFtNd.cLvFWKJI8j0md_QvAlLmZb9KaFrqJxR4jwmBJ
	YA5mtJ0B2GIYbIy95fNVGnZh4xcWu81BprKv0jOD0xfN2VR3Ypm_TRUsQqqL5j0gNLTQ9U2Gdr9o
	eiawJrkogpWwzOjlt2D.z3C6ynJ95Jsjssrq2jXJogRsnadpTdnsEKaTN6u1WyDrVXkM379zXKUM
	BtzND1UITtxrMD9I.lBtIWwF39W13_YFwVxeYo1SXMYtdCwNfFF48k3oStxsA5LBjOhj71EuQamh
	SZT7nRYoxiikFEuntep3uT_S.jS0nN67Z6P4KoENsHCcgXzOGEY4W77putFb1yXfLTvrAaj5DNtc
	Hh.f4px67bPlT.kVYrYtY6G.6dEwGY0S1k4_felxhtrBReFeXKOENQDlMFStW9D8NuOiVjTIqoly
	7dIk4jCU7iQn8Pg.4BuvtzWaS8bVeeb3QjVpxItsa78otXBHNsoQTTbHZfnM_CBjPUyDDVNkhHEO
	gtNhpVl1m3Wm_E5HjZ0fUhz1VSARvn4Qe9Q.3RtY_a51VrwihxgHDosaNcWsAwur4QUM-
Received: from sonic.gate.mail.ne1.yahoo.com by
	sonic305.consmr.mail.ne1.yahoo.com with HTTP;
	Tue, 22 Sep 2020 14:13:09 +0000
Date: Tue, 22 Sep 2020 14:13:03 +0000 (UTC)
From: Joe Wulf <joe_wulf@yahoo.com>
To: "linux-audit@redhat.com" <linux-audit@redhat.com>
Message-ID: <738651663.5183625.1600783983768@mail.yahoo.com>
Subject: augenrules --load
MIME-Version: 1.0
References: <738651663.5183625.1600783983768.ref@mail.yahoo.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: linux-audit@redhat.com
X-BeenThere: linux-audit@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: Linux Audit Discussion <linux-audit.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-audit>,
	<mailto:linux-audit-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-audit>
List-Post: <mailto:linux-audit@redhat.com>
List-Help: <mailto:linux-audit-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-audit>,
	<mailto:linux-audit-request@redhat.com?subject=subscribe>
Sender: linux-audit-bounces@redhat.com
Errors-To: linux-audit-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed; boundary="===============3051342868936143376=="

--===============3051342868936143376==
Content-Type: multipart/alternative; 
	boundary="----=_Part_5183624_1844033532.1600783983765"

------=_Part_5183624_1844033532.1600783983765
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

When building a new RHEL v7.8 VM manually, I set up the rules desired in /e=
tc/audit/rulesd/audit.rules, no other changes (because I've wanted to narro=
w down the issue). After subsequent reboots, with no further changes to any=
 audit rules either; I monitor /var/log/messages and I see occurrences like=
 this:
Sep 22 09:04:24 hostxyz augenrules: /sbin/augenrules: No change
Sep 22 09:04:24 hostxyz augenrules: No rulesSep 22 09:04:24 hostxyz augenru=
les: enabled 1Sep 22 09:04:24 hostxyz augenrules: failure 1Sep 22 09:04:24 =
hostxyz augenrules: pid 1242Sep 22 09:04:24 hostxyz augenrules: rate_limit =
0Sep 22 09:04:24 hostxyz augenrules: backlog_limit 16384Sep 22 09:04:24 hos=
txyz augenrules: lost 56Sep 22 09:04:24 hostxyz augenrules: backlog 1Sep 22=
 09:04:24 hostxyz augenrules: enabled 1Sep 22 09:04:24 hostxyz augenrules: =
failure 2Sep 22 09:04:24 hostxyz augenrules: pid 1242Sep 22 09:04:24 hostxy=
z augenrules: rate_limit 0Sep 22 09:04:24 hostxyz augenrules: backlog_limit=
 16384Sep 22 09:04:24 hostxyz augenrules: lost 56Sep 22 09:04:24 hostxyz au=
genrules: backlog 0Sep 22 09:04:24 hostxyz augenrules: usage: auditctl [opt=
ions]Sep 22 09:04:24 hostxyz augenrules: -a <l,a>=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Append rule to end of <l>ist wit=
h <a>ctionSep 22 09:04:24 hostxyz augenrules: -A <l,a>=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Add rule at beginning of <l>i=
st with <a>ctionSep 22 09:04:24 hostxyz augenrules: -b <backlog>=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Set max number of outstanding audit buffe=
rsSep 22 09:04:24 hostxyz augenrules: allowed Default=3D64Sep 22 09:04:24 h=
ostxyz augenrules: -c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Continue through errors in=
 rulesSep 22 09:04:24 hostxyz augenrules: -C f=3Df=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Compare collected fi=
elds if available:Sep 22 09:04:24 hostxyz augenrules: Field name, operator(=
=3D,!=3D), field nameSep 22 09:04:24 hostxyz augenrules: -d <l,a>=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Delete rule from =
<l>ist with <a>ctionSep 22 09:04:24 hostxyz augenrules: l=3Dtask,exit,user,=
excludeSep 22 09:04:24 hostxyz augenrules: a=3Dnever,alwaysSep 22 09:04:24 =
hostxyz augenrules: -D=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Delete all rules and wa=
tchesSep 22 09:04:24 hostxyz augenrules: -e [0..2]=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Set enabled flagSep 22 09:04:24 hostxy=
z augenrules: -f [0..2]=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 Set failure flagSep 22 09:04:24 hostxyz augenrules: 0=3Dsilent 1=
=3Dprintk 2=3DpanicSep 22 09:04:24 hostxyz augenrules: -F f=3Dv=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Build ru=
le: field name, operator(=3D,!=3D,<,>,<=3D,Sep 22 09:04:24 hostxyz augenrul=
es: >=3D,&,&=3D) valueSep 22 09:04:24 hostxyz augenrules: -h=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 HelpSep 22 09:04:24 hostxyz augenrules: -i=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 Ignore errors when reading rules from fileSep 22 09:04:24 hostxyz=
 augenrules: -k <key>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 Set filter key on audit ruleSep 22 09:04:24 hostxyz augenrules=
: -l=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 List rulesSep 22 09:04:24 hostxyz augenru=
les: -m text=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 Send a user-space messageSep 22 09:04:24 hostxyz augenrules: -p [=
r|w|x|a]=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Set permissions filter o=
n watchSep 22 09:04:24 hostxyz augenrules: r=3Dread, w=3Dwrite, x=3Dexecute=
, a=3DattributeSep 22 09:04:24 hostxyz augenrules: -q <mount,subtree>=C2=A0=
 make subtree part of mount point's dir watchesSep 22 09:04:24 hostxyz auge=
nrules: -r <rate>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 Set limit in messages/sec (0=3Dnone)Sep 22 09:04:24 hostxyz augenrules:=
 -R <file>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 read=
 rules from fileSep 22 09:04:24 hostxyz augenrules: -s=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 Report statusSep 22 09:04:24 hostxyz augenrules: -S syscall=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Build rule: syscall name or n=
umberSep 22 09:04:24 hostxyz augenrules: -t=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Tr=
im directory watchesSep 22 09:04:24 hostxyz augenrules: -v=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 VersionSep 22 09:04:24 hostxyz augenrules: -w <path>=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Insert watch at <path>S=
ep 22 09:04:24 hostxyz augenrules: -W <path>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Remove watch at <path>Sep 22 09:04:24 hostxy=
z augenrules: --loginuid-immutable=C2=A0 Make loginuids unchangeable once s=
etSep 22 09:04:24 hostxyz augenrules: --reset-lost=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 Reset the lost record counterSep 22 09:04:24 hostx=
yz systemd: Started Security Auditing Service.
The 'usage' of auditctl is invoked the one time in the 'try_load' function =
of augenrules.=C2=A0 Manual executions of "/sbin/auditctl -R /etc/audit/aud=
it.rules', results in essentially the same behavior on the terminal as foun=
d in /var/log/messages.
Should execution of augenrules seemingly error-out on invocation of auditct=
l like this?
Thank you.
R,-Joe Wulf

------=_Part_5183624_1844033532.1600783983765
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<html><head></head><body><div class=3D"ydpb45cb906yahoo-style-wrap" style=
=3D"font-family:Helvetica Neue, Helvetica, Arial, sans-serif;font-size:16px=
;"><div dir=3D"ltr" data-setdir=3D"false">When building a new RHEL v7.8 VM =
manually, I set up the rules desired in /etc/audit/rulesd/audit.rules, no o=
ther changes (because I've wanted to narrow down the issue). After subseque=
nt reboots, with no further changes to any audit rules either; I monitor /v=
ar/log/messages and I see occurrences like this:</div><div dir=3D"ltr" data=
-setdir=3D"false"><br></div><div dir=3D"ltr" data-setdir=3D"false"><div dir=
=3D"ltr" data-setdir=3D"false">Sep 22 09:04:24 hostxyz augenrules: /sbin/au=
genrules: No change<br><div>Sep 22 09:04:24  <span><span>hostxyz </span></s=
pan>augenrules: No rules</div><div>Sep 22 09:04:24  <span><span>hostxyz </s=
pan></span>augenrules: enabled 1</div><div>Sep 22 09:04:24  <span><span>hos=
txyz </span></span>augenrules: failure 1</div><div>Sep 22 09:04:24  <span><=
span>hostxyz </span></span>augenrules: pid 1242</div><div>Sep 22 09:04:24  =
<span><span>hostxyz </span></span>augenrules: rate_limit 0</div><div>Sep 22=
 09:04:24  <span><span>hostxyz </span></span>augenrules: backlog_limit 1638=
4</div><div>Sep 22 09:04:24  <span><span>hostxyz </span></span>augenrules: =
lost 56</div><div>Sep 22 09:04:24  <span><span>hostxyz </span></span>augenr=
ules: backlog 1</div><div>Sep 22 09:04:24  <span><span>hostxyz </span></spa=
n>augenrules: enabled 1</div><div>Sep 22 09:04:24  <span><span>hostxyz </sp=
an></span>augenrules: failure 2</div><div>Sep 22 09:04:24  <span><span>host=
xyz </span></span>augenrules: pid 1242</div><div>Sep 22 09:04:24  <span><sp=
an>hostxyz </span></span>augenrules: rate_limit 0</div><div>Sep 22 09:04:24=
  <span><span>hostxyz </span></span>augenrules: backlog_limit 16384</div><d=
iv>Sep 22 09:04:24  <span><span>hostxyz </span></span>augenrules: lost 56</=
div><div>Sep 22 09:04:24  <span><span>hostxyz </span></span>augenrules: bac=
klog 0</div><div><b>Sep 22 09:04:24  <span><span>hostxyz </span></span>auge=
nrules: usage: auditctl [options]</b></div><div><b>Sep 22 09:04:24  <span><=
span>hostxyz </span></span>augenrules: -a &lt;l,a&gt;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Append rule to end of &lt;l&gt=
;ist with &lt;a&gt;ction</b></div><div><b>Sep 22 09:04:24  <span><span>host=
xyz </span></span>augenrules: -A &lt;l,a&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Add rule at beginning of &lt;l&gt;ist w=
ith &lt;a&gt;ction</b></div><div><b>Sep 22 09:04:24  <span><span>hostxyz </=
span></span>augenrules: -b &lt;backlog&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; Set max number of outstanding audit buffers</b></div><div><b>Sep =
22 09:04:24  <span><span>hostxyz </span></span>augenrules: allowed Default=
=3D64</b></div><div><b>Sep 22 09:04:24  <span><span>hostxyz </span></span>a=
ugenrules: -c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Continue through errors in rules</=
b></div><div><b>Sep 22 09:04:24  <span><span>hostxyz </span></span>augenrul=
es: -C f=3Df&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; Compare collected fields if available:</b></div><div><b>Sep=
 22 09:04:24  <span><span>hostxyz </span></span>augenrules: Field name, ope=
rator(=3D,!=3D), field name</b></div><div><b>Sep 22 09:04:24  <span><span>h=
ostxyz </span></span>augenrules: -d &lt;l,a&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Delete rule from &lt;l&gt;ist with &=
lt;a&gt;ction</b></div><div><b>Sep 22 09:04:24  <span><span>hostxyz </span>=
</span>augenrules: l=3Dtask,exit,user,exclude</b></div><div><b>Sep 22 09:04=
:24  <span><span>hostxyz </span></span>augenrules: a=3Dnever,always</b></di=
v><div><b>Sep 22 09:04:24  <span><span>hostxyz </span></span>augenrules: -D=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; Delete all rules and watches</b></div><div><b>S=
ep 22 09:04:24  <span><span>hostxyz </span></span>augenrules: -e [0..2]&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Set enabled flag</=
b></div><div><b>Sep 22 09:04:24  <span><span>hostxyz </span></span>augenrul=
es: -f [0..2]&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; S=
et failure flag</b></div><div><b>Sep 22 09:04:24  <span><span>hostxyz </spa=
n></span>augenrules: 0=3Dsilent 1=3Dprintk 2=3Dpanic</b></div><div><b>Sep 2=
2 09:04:24  <span><span>hostxyz </span></span>augenrules: -F f=3Dv&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Build=
 rule: field name, operator(=3D,!=3D,&lt;,&gt;,&lt;=3D,</b></div><div><b>Se=
p 22 09:04:24  <span><span>hostxyz </span></span>augenrules: &gt;=3D,&amp;,=
&amp;=3D) value</b></div><div><b>Sep 22 09:04:24  <span><span>hostxyz </spa=
n></span>augenrules: -h&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Help</b></div><div><b>Se=
p 22 09:04:24  <span><span>hostxyz </span></span>augenrules: -i&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; Ignore errors when reading rules from file</b></div><div><b=
>Sep 22 09:04:24  <span><span>hostxyz </span></span>augenrules: -k &lt;key&=
gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Set f=
ilter key on audit rule</b></div><div><b>Sep 22 09:04:24  <span><span>hostx=
yz </span></span>augenrules: -l&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; List rules</b></=
div><div><b>Sep 22 09:04:24  <span><span>hostxyz </span></span>augenrules: =
-m text&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; Send a user-space message</b></div><div><b>Sep 22 09:04:24  <span><spa=
n>hostxyz </span></span>augenrules: -p [r|w|x|a]&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; Set permissions filter on watch</b></div><div><b>Sep 22 09:=
04:24  <span><span>hostxyz </span></span>augenrules: r=3Dread, w=3Dwrite, x=
=3Dexecute, a=3Dattribute</b></div><div><b>Sep 22 09:04:24  <span><span>hos=
txyz </span></span>augenrules: -q &lt;mount,subtree&gt;&nbsp; make subtree =
part of mount point's dir watches</b></div><div><b>Sep 22 09:04:24  <span><=
span>hostxyz </span></span>augenrules: -r &lt;rate&gt;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Set limit in messages/sec (0=3Dnone=
)</b></div><div><b>Sep 22 09:04:24  <span><span>hostxyz </span></span>augen=
rules: -R &lt;file&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; read rules from file</b></div><div><b>Sep 22 09:04:24  <span><span>=
hostxyz </span></span>augenrules: -s&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Report stat=
us</b></div><div><b>Sep 22 09:04:24  <span><span>hostxyz </span></span>auge=
nrules: -S syscall&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Bu=
ild rule: syscall name or number</b></div><div><b>Sep 22 09:04:24  <span><s=
pan>hostxyz </span></span>augenrules: -t&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Trim di=
rectory watches</b></div><div><b>Sep 22 09:04:24  <span><span>hostxyz </spa=
n></span>augenrules: -v&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Version</b></div><div><b=
>Sep 22 09:04:24  <span><span>hostxyz </span></span>augenrules: -w &lt;path=
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Insert wat=
ch at &lt;path&gt;</b></div><div><b>Sep 22 09:04:24  <span><span>hostxyz </=
span></span>augenrules: -W &lt;path&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; Remove watch at &lt;path&gt;</b></div><div dir=3D"=
ltr" data-setdir=3D"false"><b>Sep 22 09:04:24  <span><span><span>hostxyz </=
span></span></span>augenrules: --loginuid-immutable&nbsp; Make loginuids un=
changeable once set</b></div><div><b>Sep 22 09:04:24  <span><span><span>hos=
txyz </span></span></span>augenrules: --reset-lost&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; Reset the lost record counter</b></div><div>Sep 22 =
09:04:24  <span><span><span>hostxyz </span></span></span>systemd: Started S=
ecurity Auditing Service.</div></div><div><br></div><div dir=3D"ltr" data-s=
etdir=3D"false">The 'usage' of auditctl is invoked the one time in the 'try=
_load' function of augenrules.&nbsp; Manual executions of "/sbin/auditctl -=
R /etc/audit/audit.rules', results in essentially the same behavior on the =
terminal as found in /var/log/messages.</div><div dir=3D"ltr" data-setdir=
=3D"false"><br></div><div dir=3D"ltr" data-setdir=3D"false">Should executio=
n of augenrules seemingly error-out on invocation of auditctl like this?</d=
iv><div dir=3D"ltr" data-setdir=3D"false"><br></div><div dir=3D"ltr" data-s=
etdir=3D"false">Thank you.</div><div dir=3D"ltr" data-setdir=3D"false"><br>=
</div><div dir=3D"ltr" data-setdir=3D"false">R,</div><div dir=3D"ltr" data-=
setdir=3D"false">-Joe Wulf<br></div></div></div></body></html>
------=_Part_5183624_1844033532.1600783983765--

--===============3051342868936143376==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
--===============3051342868936143376==--

