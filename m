Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id ACC3A2CCDF1
	for <lists+linux-audit@lfdr.de>; Thu,  3 Dec 2020 05:34:35 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-347-vWXnYePjN-m5HsvbJjZfxw-1; Wed, 02 Dec 2020 23:34:31 -0500
X-MC-Unique: vWXnYePjN-m5HsvbJjZfxw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4FDF0185E489;
	Thu,  3 Dec 2020 04:34:26 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D079B5D9CA;
	Thu,  3 Dec 2020 04:34:25 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id DEB51180954D;
	Thu,  3 Dec 2020 04:34:24 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0B34XljV017590 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 2 Dec 2020 23:33:47 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 5F3A3D7B2A; Thu,  3 Dec 2020 04:33:47 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 59127D7B2B
	for <linux-audit@redhat.com>; Thu,  3 Dec 2020 04:33:45 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2A6FF185A794
	for <linux-audit@redhat.com>; Thu,  3 Dec 2020 04:33:45 +0000 (UTC)
Received: from sonic305-20.consmr.mail.ne1.yahoo.com
	(sonic305-20.consmr.mail.ne1.yahoo.com [66.163.185.146]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-286-uxKANK2VO4eLocU40tviIQ-1;
	Wed, 02 Dec 2020 23:33:42 -0500
X-MC-Unique: uxKANK2VO4eLocU40tviIQ-1
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
	t=1606970022; bh=oN9rSW7VJd3BukPLAa7aGRJt0QFlKZ3UwX2tSDLwWo+=;
	h=Date:From:To:Subject:From:Subject;
	b=q4Aa9dOCq4O6E+05e4kE6EJk3nTd3RfCysiQBxSuzjZJQzE5m0h/Nb+AFlNRsM/AINd0wd6HOXNNSkyhpZPNMWJVxZn3a/7wE3RQhKx9kWplnJfJXe7Fd+F+dgWL/q2RKe2qsqjJ0aHsoX2Oh9qdOekwOjfcQhVFqgKOrYAbSDfp9I5a3oFr4GseR20N1SougGtmJWYO2/LDZsBapsYm9H4TGvuGrronBnpsEiIMFu2RLB3pyHw/BY4KGwZYxqC7sIB3cNxweHqPFF5iPqC6iBOoDT6vdj4WY+rsFI2hA/KOW7U+pcodwCpwFt4UVHEIlgI4vBgG7rn2uSTeiHv9yA==
X-YMail-OSG: pp37aX0VM1mfRMgIZooev0InWA42vYX3nqe4UsnEOyHM71ohA6T8OmnfUaVa1hU
	cOdulxPLefyyPKd3ncBJoCgnmK9yhRREP_piGy1vH33YcNrIzhRfHdlXpjlyAOBMd6BV8SQwIGkh
	rlHXemx9X.eWl7G8d0Si3OsEkm_ESOLxQxCuJsTrx2VUkMQZ8ZaCCnARowfUEh6tHOn1KMJautsO
	Sy0wgeEmsO.c0zkaEzdkggDNNwu3B8oH6F.Tv_YJlNjs3oKFv8PoskRi1iTbFkVE1lZ6bHHiuZfc
	p6YVLxJAIoiCRByzRit5FZ3UlHCQ8QJYMf.DMBgmRXvdMJgfq.pE6V69cGDfJBJ6RS0MpO7dQ0RB
	sI_Du5sNd6oxYwcun6M39tsQa9O8.gWteXITZAJFk8lu2nI5Nf7npf.t1BpZL_eFOjEYhiWV0snU
	LDbU1UL6hwSoOLLKKZdHCBj9.GyZTzERA5lWO9fssQS1oo2VbUNAe7drqQ0k2oEOUzqP.Tn04bv5
	8TJLWY9fefMwZigAs4ZVaXqYER2ly3kO61SbS37S2IxHCz6umw0dxfRdhL7PDwKGIwYsGZL8WD15
	vQLru9P1ISFDRMkd4Gl7S06yPWIMPSeRzWTdgcOfVGJ15BkL7FEk_3HgUYccCaw3XQLCSQFXOgWe
	.6ERN5G.8j0y_pmjf9nCY.3jY6UOye1Gk0b_GwOgg87M.fcghZzSw7uoxlWwpw3T0XtU036rOu3P
	2OgsfA3zSzdGvm48N_PSIMD0OJW3xap0XwWaPG40FHLVqP6pxG45KJQfjieAUn0K08nuFefxsrqg
	iWSlCQHNvzhbozYngBUduyztyx5j7N8mVFijiRxUIkgB.LWZzdO3uY5gy27Wau0faxPZYiuFZWqe
	9NagHeBwVBGq1N2rorClg6HdF14tpjntzBOTudGy8yQOk.TrenR1yPm.yvU1bU8E2UdRAMXDtspF
	s2Lliwae76oVMDOS4kCTb1Enu11r8RhUvPsvMM.OzuVxsAlPdDRFZh.wVo9rGYBoOkJUs9dVKg3B
	MUtD9DRyYMjK3BiMS0fyZncfFon.icZsKRfvT4wj1UWLrt6mxOHXgK1FR3Q_l.0LPxdMtQ8jKqx.
	A9tXSaepZz4i4Tui6sw_lHyZNCJB70elMcYID2rO9uOp2Wn1OaHA6hp.x9vPDVK0pW.da4bJiJ5N
	FuagPeIA.QTuWgCMsZHFwMlTAIvIxzMD7VL2ozZQ2fm_frqO9u0wgxfYUXt.1OeNTxKv_LybKRH4
	F6mSmLyp7MszQ_dmPDnOKoIfsiX4HAFhMAcWEpE5dpMOdYGIg_476qgN.oAL1LxDWzwrzytudKDK
	R4ao6ccLtS7PM5ZnXSF20wblqeL3ZPTb3dLx.uKQ8ddPfRbXVzM_Cn0PTE1CLZfQgcNDq3dL2cJS
	_e9KqOMdXF4tR59EhiYH91TLFWHx0z6PcqCjHyOlZin2Y0URa4aTyAho.xatYfGnoH.jKZdYLQvX
	MkV2BBQfTytE_Rtz2F78JTRPJuObDPiX1TL5h_wGrLSwZV9LDpNL3TQTHztENwnx7MKTNdywwZQJ
	QmrbrK1yWCQa8kv4Yq59cZCe_ocapnVhgz_DBA2ht5Kbu8j9MRIcG76cj0YhvUzJNKgQ1xday3kJ
	lUoL7fAXGgqOXdZdqMPT7hWft4shgBJ.5xQLJnK1ZTliNYdFIga_b49grSogDwNpFJ06njTy0ply
	rKgniMLML8uNHZ1LBiqERO27jeMdJOXMI_LwCGAWa8P5fcCpj51EKRAxeI7Elnevm9MEKcwVzCKd
	6X0DAtAhH1DbmtYmoYQhjvmMpRCM_V4G__j3Z2IWPvXXrtlyJinZH6adCw6cWuniLMf2B9ILBbQx
	IkQXv5x0GEOgCHhOKjKEaGJwNt_pvODXNsEIyEFyygd1.eDCBnSG17ETZvi46dlFFJX5mOkPPwKc
	bnfFsNTaFrmRPAldWrftd89r.duAVTls3LH4iJp49Z9cJzerOudKOKYcNCvwfXoS5PcS5_JH2CU4
	hcJlCmm.MS.PC5iCO1VzwnpuSzGqYU6KSFF_wihEPngGwnNgxk8gyeBKHnwPpRs7J5DaxC3yYGXe
	ZpFBU6VFq3tmQ.uzjU57SBhmChrYnbBIt9KkbWE6ob84si41flDYAxw5SP3o9_n5RKelwBNU8Zv1
	YuFk8pkbs1tD9QoktQ8Oh9ExLqAmq.N_DeUYfnxEHgMrR.sK4VsX8I7vnXS06a5eJ6v3Zf45nQb7
	gSGUNS2uzaNmwuHoByiD5oYqXtOOth0kVlZmVez.xEeKqhmrXUguD.v8P474_LZ_roCTrRwbcpW5
	kCS_vTNOjen1S5fFkjqUgcNeqDKru0nEtC0Y8L507BMCuhNM9_AXk89fbblR3tUPtKB8oiNTz.Pq
	5RcG2KsVkaK_FFSecuT6jdjKm2J5nc6qCYen5KXCZlLRYdNkZOMeh.jRChMCqcXstC6ALCJKgoHM
	hkuOWvrsEqMJhl9QEMFcxeMdYL2znqwfxLv0Kv47Ge6X6VLNVB4y9zvbyKEtMfsVuHVnkVN9EVaY
	OFxoWb3wKEfaNunGYjhma7oJuOM.hBGro69dY7etjyPU-
Received: from sonic.gate.mail.ne1.yahoo.com by
	sonic305.consmr.mail.ne1.yahoo.com with HTTP;
	Thu, 3 Dec 2020 04:33:42 +0000
Date: Thu, 3 Dec 2020 04:33:39 +0000 (UTC)
From: Joe Wulf <joe_wulf@yahoo.com>
To: Paul Moore <paul@paul-moore.com>, Eric Paris <eparis@redhat.com>,
	"linux-audit@redhat.com" <linux-audit@redhat.com>,
	Max Englander <max.englander@gmail.com>
Message-ID: <848576065.3879079.1606970019196@mail.yahoo.com>
In-Reply-To: <20200701213244.GA1817@linux-kernel-dev>
References: <20200701213244.GA1817@linux-kernel-dev>
Subject: Re: [PATCH v2] audit: report audit wait metric in audit status reply
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
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
Content-Type: multipart/mixed; boundary="===============7710176723886212147=="

--===============7710176723886212147==
Content-Type: multipart/alternative; 
	boundary="----=_Part_3879078_1172853224.1606970019194"

------=_Part_3879078_1172853224.1606970019194
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

I would like to suggest providing a mechanism where admins can query the st=
atus or state of backlog issues (wait time, sums, etc...).=C2=A0 Maybe the =
intent is to expand the output of status checking of auditd.

I believe further clarity is beneficial on the setting of the 'backlog_wait=
_sum' (or to whatever the name evolves to) initially.-=C2=A0 How it evolves=
 over time-=C2=A0 What the conditions in the system, or auditing, would cha=
nge it-=C2=A0 What conditions admins should pay attention to for informatio=
nal understanding of status
-=C2=A0 What conditions admins should realize exist such that adjustments a=
re needed=C2=A0=C2=A0 (and suggestions to what those adjustments should be)=
-=C2=A0 What new guidance will admins have for building adjusting audit.rul=
es around this

Consider the scenario where auditing has been 'working fine' for days.Littl=
e to no active admin monitoring.Events occur to spike the auditing such tha=
t backloging of audit records dramatically increases.(for some reason) admi=
ns now come looking to investigate.Assuming they do:=C2=A0 'systemctl statu=
s auditd' the newly presented 'state' of the 'backlog_wait_sum' will show s=
ome evidence.Q:=C2=A0 Is that just a moment in time?Q:=C2=A0 What informati=
on here will give the perspective things are good/ok 'now', versus some act=
ion needs to be taken?
Maybe that isn't a great scenario, or good questions----it is what occurs t=
o me at the moment.

Thank you.
R,-Joe Wulf

    On Wednesday, July 1, 2020, 5:33:14 PM EDT, Max Englander <max.englande=
r@gmail.com> wrote: =20
 >=C2=A0 In environments where the preservation of audit events and predict=
able
>=C2=A0 usage of system memory are prioritized, admins may use a combinatio=
n of>=C2=A0 --backlog_wait_time and -b options at the risk of degraded perf=
ormance>=C2=A0 resulting from backlog waiting. In some cases, this risk may=
 be>=C2=A0 preferred to lost events or unbounded memory usage. Ideally, thi=
s risk>=C2=A0 can be mitigated by making adjustments when backlog waiting i=
s detected.>=C2=A0 >=C2=A0 However, detection can be diffult using the curr=
ently available metrics.>=C2=A0 For example, an admin attempting to debug d=
egraded performance may>=C2=A0 falsely believe a full backlog indicates bac=
klog waiting. It may turn>=C2=A0 out the backlog frequently fills up but dr=
ains quickly.>=C2=A0 >=C2=A0 To make it easier to reliably track degraded p=
erformance to backlog>=C2=A0 waiting, this patch makes the following change=
s:>=C2=A0 >=C2=A0 Add a new field backlog_wait_sum to the audit status repl=
y. Initialize>=C2=A0 this field to zero. Add to this field the total time s=
pent by the>=C2=A0 current task on scheduled timeouts while the backlog lim=
it is exceeded.>=C2=A0 >=C2=A0 Tested on Ubuntu 18.04 using complementary c=
hanges to the audit>=C2=A0 userspace: https://github.com/linux-audit/audit-=
userspace/pull/134.
<snip>
  
------=_Part_3879078_1172853224.1606970019194
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<html><head></head><body><div class=3D"ydp398bf9d4yahoo-style-wrap" style=
=3D"font-family:Helvetica Neue, Helvetica, Arial, sans-serif;font-size:16px=
;" dir=3D"ltr" data-setdir=3D"false"><div></div><div>I would like to sugges=
t providing a mechanism where admins can query the status or state of backl=
og issues (wait time, sums, etc...).&nbsp; Maybe the intent is to expand th=
e output of status checking of auditd.<br></div><div><br></div><div dir=3D"=
ltr" data-setdir=3D"false">I believe further clarity is beneficial on the s=
etting of the 'backlog_wait_sum' (or to whatever the name evolves to) initi=
ally.</div><div dir=3D"ltr" data-setdir=3D"false">-&nbsp; How it evolves ov=
er time</div><div dir=3D"ltr" data-setdir=3D"false">-&nbsp; What the condit=
ions in the system, or auditing, would change it</div><div dir=3D"ltr" data=
-setdir=3D"false">-&nbsp; What conditions admins should pay attention to fo=
r informational understanding of status<br></div><div dir=3D"ltr" data-setd=
ir=3D"false">-&nbsp; What conditions admins should realize exist such that =
adjustments are needed</div><div dir=3D"ltr" data-setdir=3D"false">&nbsp;&n=
bsp; (and suggestions to what those adjustments should be)</div><div dir=3D=
"ltr" data-setdir=3D"false">-&nbsp; What new guidance will admins have for =
building adjusting audit.rules around this<br></div><div dir=3D"ltr" data-s=
etdir=3D"false"><br></div><div dir=3D"ltr" data-setdir=3D"false">Consider t=
he scenario where auditing has been 'working fine' for days.</div><div dir=
=3D"ltr" data-setdir=3D"false">Little to no active admin monitoring.</div><=
div dir=3D"ltr" data-setdir=3D"false">Events occur to spike the auditing su=
ch that backloging of audit records dramatically increases.</div><div dir=
=3D"ltr" data-setdir=3D"false">(for some reason) admins now come looking to=
 investigate.</div><div dir=3D"ltr" data-setdir=3D"false">Assuming they do:=
&nbsp; 'systemctl status auditd' the newly presented 'state' of the 'backlo=
g_wait_sum' will show some evidence.</div><div dir=3D"ltr" data-setdir=3D"f=
alse">Q:&nbsp; Is that just a moment in time?</div><div dir=3D"ltr" data-se=
tdir=3D"false">Q:&nbsp; What information here will give the perspective thi=
ngs are good/ok 'now', versus some action needs to be taken?</div><div dir=
=3D"ltr" data-setdir=3D"false"><br></div><div dir=3D"ltr" data-setdir=3D"fa=
lse">Maybe that isn't a great scenario, or good questions----it is what occ=
urs to me at the moment.<br></div><br><div dir=3D"ltr" data-setdir=3D"false=
">Thank you.</div><div dir=3D"ltr" data-setdir=3D"false"><br></div><div dir=
=3D"ltr" data-setdir=3D"false">R,</div><div dir=3D"ltr" data-setdir=3D"fals=
e">-Joe Wulf</div><div dir=3D"ltr" data-setdir=3D"false"><br></div><div><br=
></div>
       =20
        </div><div id=3D"ydp8386d029yahoo_quoted_7689069360" class=3D"ydp83=
86d029yahoo_quoted">
            <div style=3D"font-family:'Helvetica Neue', Helvetica, Arial, s=
ans-serif;font-size:13px;color:#26282a;">
               =20
                <div>
                    On Wednesday, July 1, 2020, 5:33:14 PM EDT, Max England=
er &lt;max.englander@gmail.com&gt; wrote:
                </div>
               =20
                <div><br></div>
                <div dir=3D"ltr" data-setdir=3D"false">&gt;&nbsp; In enviro=
nments where the preservation of audit events and predictable<br><div><span=
>&gt;&nbsp; </span>usage of system memory are prioritized, admins may use a=
 combination of</div><div><span>&gt;&nbsp; </span>--backlog_wait_time and -=
b options at the risk of degraded performance</div><div><span>&gt;&nbsp; </=
span>resulting from backlog waiting. In some cases, this risk may be</div><=
div><span>&gt;&nbsp; </span>preferred to lost events or unbounded memory us=
age. Ideally, this risk</div><div><span>&gt;&nbsp; </span>can be mitigated =
by making adjustments when backlog waiting is detected.</div><div><span>&gt=
;&nbsp; </span></div><div><span>&gt;&nbsp; </span>However, detection can be=
 diffult using the currently available metrics.</div><div><span>&gt;&nbsp; =
</span>For example, an admin attempting to debug degraded performance may</=
div><div><span>&gt;&nbsp; </span>falsely believe a full backlog indicates b=
acklog waiting. It may turn</div><div><span>&gt;&nbsp; </span>out the backl=
og frequently fills up but drains quickly.</div><div><span>&gt;&nbsp; </spa=
n></div><div><span>&gt;&nbsp; </span>To make it easier to reliably track de=
graded performance to backlog</div><div><span>&gt;&nbsp; </span>waiting, th=
is patch makes the following changes:</div><div><span>&gt;&nbsp; </span></d=
iv><div><span>&gt;&nbsp; </span>Add a new field backlog_wait_sum to the aud=
it status reply. Initialize</div><div><span>&gt;&nbsp; </span>this field to=
 zero. Add to this field the total time spent by the</div><div><span>&gt;&n=
bsp; </span>current task on scheduled timeouts while the backlog limit is e=
xceeded.</div><div><span>&gt;&nbsp; </span></div><div><span>&gt;&nbsp; </sp=
an>Tested on Ubuntu 18.04 using complementary changes to the audit</div><di=
v><span>&gt;&nbsp; </span>userspace: https://github.com/linux-audit/audit-u=
serspace/pull/134.</div><br>&lt;snip&gt;<br></div>
            </div>
        </div></body></html>
------=_Part_3879078_1172853224.1606970019194--

--===============7710176723886212147==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
--===============7710176723886212147==--

