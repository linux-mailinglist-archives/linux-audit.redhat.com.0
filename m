Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 0FDC628E501
	for <lists+linux-audit@lfdr.de>; Wed, 14 Oct 2020 19:04:50 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-324-4lPzVyfFNm-TIsb1eAokBg-1; Wed, 14 Oct 2020 13:04:47 -0400
X-MC-Unique: 4lPzVyfFNm-TIsb1eAokBg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 29384801F97;
	Wed, 14 Oct 2020 17:04:42 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F07A35C1BD;
	Wed, 14 Oct 2020 17:04:41 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 191BB58133;
	Wed, 14 Oct 2020 17:04:41 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 09EGpran030076 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 14 Oct 2020 12:51:53 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 5C73C208BDD6; Wed, 14 Oct 2020 16:51:53 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5706D208BDDE
	for <linux-audit@redhat.com>; Wed, 14 Oct 2020 16:51:51 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 225FB805C1E
	for <linux-audit@redhat.com>; Wed, 14 Oct 2020 16:51:51 +0000 (UTC)
Received: from sonic313-56.consmr.mail.ne1.yahoo.com
	(sonic313-56.consmr.mail.ne1.yahoo.com [66.163.185.31]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-459-8KvmVTvCNwSn-EmY22dGyA-1;
	Wed, 14 Oct 2020 12:51:48 -0400
X-MC-Unique: 8KvmVTvCNwSn-EmY22dGyA-1
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
	t=1602694307; bh=Ns+TQnspf+IN163KXFw4Nd1CmMbrB50xpOoNNvMLx95=;
	h=Date:From:To:Subject;
	b=jCGMxOOzUwTQ7oinMX0H75bbWKxHCoWLvWtnTG9ZLl9Gg7Hj+fE4QmlptS382RLb3EB1YPwFydXS6hMRFCenQX90ajKINZ25d/iyN0pTL9p5vrmF5wg4NNE/KJdAoUGjhmWHSc/PuM+45TyoA78xOzdqSVQm9MEFVXKCBWKgGuYsyYOO1eyWytJaShh0kqnVHFSAHxevjQ8zR7dAoDhr3Ch2aprBdX9IoXcmeb9zxloAH5y3t3A4RxDyoucbkh5+UbbVubmil2oAOfePMpk8IyJu+nhLoha7VQCo/61Qret1mbv5KdU9rhzE1MioBVf1bg8G/d1Uekq9Bu4EekzWSw==
X-YMail-OSG: .2cZBm4VM1myU67_86u6.MwQUauHDwW.h7TT9KFyjbXTAEXqPITBq8ytziH9Plk
	HQal2Kfk9iGdbHFovJVgOimn5euOemCD3lGXvENfIgRJPUEsJKQRsgfEhOyOX7xNH_KROonRRVD2
	LJtpaILK2tupzmxDDxPqugGZX6pqQShEUXWA3P5Z2x.6rmqNyPFzopXd1eYA3DS.F_bElbtj7XYy
	iZgBMYhrdfkhy9bg.pzupsJE7RjLgmBcqCKlDKsdrYd1y5xAoZos7Iy__EyAoxzjfSxV6TZc_R1o
	xo9bC3NsVqzaNONV6aLjL3bSrpl.6If70x37dpOS4pybW6WloPZDiH6d0sNTVbEJLDdRElRzGQ6B
	JdAC.1viSoKPWg4LVn9VpNq0MnEl780hOdQur4k4bsM_S5ozxpa320G7b4qm5CmGgrytagw.nse1
	1MO4SM7_XxPZHzX45b.FoqSZEzE3DWHcrJMHN8Oi1TxWt4RYxgQp9lR9lAVtuQ9tYZI7HwUZFyKd
	LIu1kE3qcTs00E33MuxH0ITjnFlAhEDSR_tz3dgURXmao8U61pgvGFaB2syJkQEOgC3GDOIkguJn
	VFKZ30zqsXDDhgEKFuTcDFWZa0tHlcIFKikiZa5aL3uvTc7GXqh1.uDfK5PZR0Jc45_IxiiKvdmB
	fpYVdAGUB0Bf_mKlWDy7WqDMXeGHml1c_xx7hBVRVxEYUkjPLbS9P6Nu2jpzH3XsdO_3x5O7h_UE
	tyKW3ZXp1PgdYSmIqqZIACi4GiHtcJ.UDsXkg133b7xFpu4JBY28F0Wy3nkzuheZwab1aFeuu_h0
	PirBDv79mMIJFzdTatBsDV9NM1brbprHVkFbBVjGJT4_t6FJhqGyyIoOp8S7voOwwOXErBFv1DuB
	gJBCTrhGqVgaD5HMUf9ls2UvT5r7Q_HsXqs2as1rqnpF7Y7d_j0llsmQxfTj5vubPw9xL2KxVF6X
	bKL5358DyBeP8cIQYfsKyN3mDQmfy6I9oi4bNLLrGmy2dEpz4i7IqZH16171aCWcUP8W3mo8.sSg
	llFHqNcq0UoSnoU.ctJNQV61jx.hUVyfBCV8ockesovduA5sRsefzBMjHgcLgvHSYg6ou478iWAE
	B_pzL8_NNa.Lf9zv28Q2.PE6OdloKmq9U950eqSWV.YK2Ws_JRi5lItBUGPUzQLwj6m5ypNscUat
	eGIw3526Bkz43rUDwYM2Cxu0AkTNLGCxITU1NY8_lwxV74Q2_uTGP6DVvvWE54WwNXGmZHT7RJSZ
	plVlWv5iZJtaJ6k8avTtF73wblQ.IfMfBZ.cQ3x_2knG6t0Rdd0JESjO2HXO0KIcNTckmfsY528D
	D5EKzVYW9WOD_rgiSycfFRy.8ie1p_wcjmK4.KAoQ0ln2Gy3M83eiynA.iuoPLHge_oOae3Yvor_
	YfJVniKVIXnakWegfBP0d7NLzNSw8P6zWtK78T1xPjDQ4qMTDf8nfigQu.M6k4NVqA97lJCE42UP
	foH45jnhxLdng_bf_Lju4wtJUxoyfva1Gc.Q10Cf3i0c-
Received: from sonic.gate.mail.ne1.yahoo.com by
	sonic313.consmr.mail.ne1.yahoo.com with HTTP;
	Wed, 14 Oct 2020 16:51:47 +0000
Date: Wed, 14 Oct 2020 16:51:44 +0000 (UTC)
From: Fabio Sbano <fsbano@yahoo.com>
To: "linux-audit@redhat.com" <linux-audit@redhat.com>
Message-ID: <1025996531.618266.1602694304884@mail.yahoo.com>
Subject: Auditd is not turning off the system on (RHEL7.+)
MIME-Version: 1.0
References: <1025996531.618266.1602694304884.ref@mail.yahoo.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: linux-audit@redhat.com
X-Mailman-Approved-At: Wed, 14 Oct 2020 13:04:23 -0400
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed; boundary="===============7003004011039649455=="

--===============7003004011039649455==
Content-Type: multipart/alternative; 
	boundary="----=_Part_618265_174945545.1602694304883"

------=_Part_618265_174945545.1602694304883
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

My /etc/audit/auditd.conf is configured as below=C2=A0but it is not turning=
 off the system

## This file controls the configuration of the audit daemon#
local_events =3D yeswrite_logs =3D yeslog_file =3D /var/log/audit/audit.log=
log_group =3D rootlog_format =3D RAWflush =3D INCREMENTAL_ASYNCfreq =3D 50m=
ax_log_file =3D 8num_logs =3D 5priority_boost =3D 4disp_qos =3D lossydispat=
cher =3D /sbin/audispdname_format =3D NONE##name =3D mydomainmax_log_file_a=
ction =3D ROTATEspace_left =3D 75space_left_action =3D SYSLOGverify_email =
=3D yesaction_mail_acct =3D rootadmin_space_left =3D 50admin_space_left_act=
ion =3D haltdisk_full_action =3D SUSPENDdisk_error_action =3D SUSPENDuse_li=
bwrap =3D yes##tcp_listen_port =3D 60tcp_listen_queue =3D 5tcp_max_per_addr=
 =3D 1##tcp_client_ports =3D 1024-65535tcp_client_max_idle =3D 0enable_krb5=
 =3D nokrb5_principal =3D auditd##krb5_key_file =3D /etc/audit/audit.keydis=
tribute_network =3D no



Best Regards,Fabio Sbano

------=_Part_618265_174945545.1602694304883
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<html><head></head><body><div class=3D"yahoo-style-wrap" style=3D"font-fami=
ly:Helvetica Neue, Helvetica, Arial, sans-serif;font-size:16px;"><div dir=
=3D"ltr" data-setdir=3D"false"><div><div data-test-id=3D"message-view-body"=
 class=3D"ydp3e64e2feI_52qC ydp3e64e2feD_FY ydp3e64e2feW_6D6F" style=3D"wid=
th: 1956px;"><div class=3D"ydp3e64e2femsg-body ydp3e64e2feP_wpofO ydp3e64e2=
femq_AS" data-test-id=3D"message-view-body-content"><div class=3D"ydp3e64e2=
fejb_0 ydp3e64e2feX_6MGW ydp3e64e2feN_6Fd5"><div id=3D"ydp3e64e2feyiv568242=
6798"><div class=3D"ydp3e64e2feyiv5682426798yahoo-style-wrap" style=3D"font=
-size: 16px;"><div dir=3D"ltr">My /etc/audit/auditd.conf is configured as b=
elow&nbsp;but it is not turning off the system<br></div><div dir=3D"ltr"><b=
r></div><div dir=3D"ltr"><div><div>#</div><div># This file controls the con=
figuration of the audit daemon</div><div>#</div><div><br></div><div>local_e=
vents =3D yes</div><div>write_logs =3D yes</div><div>log_file =3D /var/log/=
audit/audit.log</div><div>log_group =3D root</div><div>log_format =3D RAW</=
div><div>flush =3D INCREMENTAL_ASYNC</div><div>freq =3D 50</div><div>max_lo=
g_file =3D 8</div><div>num_logs =3D 5</div><div>priority_boost =3D 4</div><=
div>disp_qos =3D lossy</div><div>dispatcher =3D /sbin/audispd</div><div>nam=
e_format =3D NONE</div><div>##name =3D mydomain</div><div>max_log_file_acti=
on =3D ROTATE</div><div>space_left =3D 75</div><div>space_left_action =3D S=
YSLOG</div><div>verify_email =3D yes</div><div>action_mail_acct =3D root</d=
iv><div>admin_space_left =3D 50</div><div>admin_space_left_action =3D halt<=
/div><div>disk_full_action =3D SUSPEND</div><div>disk_error_action =3D SUSP=
END</div><div>use_libwrap =3D yes</div><div>##tcp_listen_port =3D 60</div><=
div>tcp_listen_queue =3D 5</div><div>tcp_max_per_addr =3D 1</div><div>##tcp=
_client_ports =3D 1024-65535</div><div>tcp_client_max_idle =3D 0</div><div>=
enable_krb5 =3D no</div><div>krb5_principal =3D auditd</div><div>##krb5_key=
_file =3D /etc/audit/audit.key</div><div>distribute_network =3D no</div><di=
v><br></div></div><div><br></div><div><br></div><div><br></div><div dir=3D"=
ltr">Best Regards,</div><div dir=3D"ltr">Fabio Sbano</div></div></div></div=
></div></div><div class=3D"ydp3e64e2fejb_0 ydp3e64e2feX_6MGW ydp3e64e2feN_6=
Fd5"></div></div><div class=3D"ydp3e64e2feH_7jIs ydp3e64e2feD_F ydp3e64e2fe=
ab_C ydp3e64e2feQ_69H5 ydp3e64e2feE_36RhU" data-test-id=3D"toolbar-hover-ar=
ea"><div class=3D"ydp3e64e2feD_F ydp3e64e2feW_6D6F ydp3e64e2fer_BN ydp3e64e=
2fegl_C" data-test-id=3D"card-toolbar" style=3D"width: 1984.33px;"></div></=
div></div><br></div></div></body></html>
------=_Part_618265_174945545.1602694304883--

--===============7003004011039649455==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
--===============7003004011039649455==--

