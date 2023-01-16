Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B13F666C647
	for <lists+linux-audit@lfdr.de>; Mon, 16 Jan 2023 17:17:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1673885869;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=4/GloD2ILF0uFq38wnG1+yMSbsDJ/MZ08QT70Dy8n5A=;
	b=ZkP3/R0HsbGX4zQzlbdgpJEa8EqvOcz3LHfDD4lCH5iTjs8619FbGviaJq27W887osqayq
	rcRnVcInZMYrSyUh2BFQZh7VZFdBFMGNHSRd19E9db3geMIAK4i8DBhJLEjxzrugIj8KSP
	l1tusLxdUnE7ecHOOPjVfk26Dl75dHg=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-497-6QaDvMu3PVumgyeqI-pBXQ-1; Mon, 16 Jan 2023 11:17:48 -0500
X-MC-Unique: 6QaDvMu3PVumgyeqI-pBXQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 272AC3806702;
	Mon, 16 Jan 2023 16:17:46 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 59B6940C2004;
	Mon, 16 Jan 2023 16:17:39 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 7F39E19465A4;
	Mon, 16 Jan 2023 16:17:38 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id E35AF1946587 for <linux-audit@listman.corp.redhat.com>;
 Mon, 16 Jan 2023 16:16:02 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id CF7FA40C2064; Mon, 16 Jan 2023 16:16:02 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C73A440C2004
 for <linux-audit@redhat.com>; Mon, 16 Jan 2023 16:16:02 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AB203381494D
 for <linux-audit@redhat.com>; Mon, 16 Jan 2023 16:16:02 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-367-cJXSGHprMUmNWoXYcI-88g-1; Mon, 16 Jan 2023 11:16:00 -0500
X-MC-Unique: cJXSGHprMUmNWoXYcI-88g-1
Received: by mail-wm1-f43.google.com with SMTP id
 f25-20020a1c6a19000000b003da221fbf48so6224702wmc.1
 for <Linux-audit@redhat.com>; Mon, 16 Jan 2023 08:16:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=fLsg/eG5snPiG4Fhl2cJg7VnwcVA98joRakB0UlJdGM=;
 b=aVqegbwo/UVGAvfo2ffGF1bG1ROSBZsqR4ITtAmV5U/kA6FptNBo8ybYvgfH8n5RSB
 o0bjqG8f80MVpaRxd3XiTIiKMzSU8NzRiKw2en4eoh1bBsazNZQpIDbEK3f52PTNtGhe
 rsnbNkl37MWX7kNz2R/sYCFPYyf+cJeGUs9V1x1GZU8b87oTAC827Y9USVpIzUo767ua
 fuucBPAky/k4fKjdko5R+wl2dE43XIBjkjwsGC9EgaWOZXMqdlKukseJAEJvJpQn7bKI
 NCUZrPWSSCOihiQlaQWOawfdXV1R46LUlA0e24025xqn+hi+pLKNiJYHMklWW1TPdi6R
 ciSQ==
X-Gm-Message-State: AFqh2koxyGcJPqtuRRGB3hfL1LkOWM2ZdOITDDPpGzQViKkIwLSudrpc
 4jR6QwY0n/g8Ex0O8sqTjo+niTnBpHl0kUovp7Ta6dO7WrWx0ieU
X-Google-Smtp-Source: AMrXdXu6F5qRspV2Vy74Igm1Yl2AkGP+a8H/BeahIMFmKVviFW8F2y3aWj8xhAi9RXJuvq1Zypw8n9Kye73kr0GqpX8=
X-Received: by 2002:a05:600c:54cc:b0:3db:1ed:6388 with SMTP id
 iw12-20020a05600c54cc00b003db01ed6388mr5337wmb.36.1673885759223; Mon, 16 Jan
 2023 08:15:59 -0800 (PST)
MIME-Version: 1.0
From: Avtansh Gupta <avtanshgupta1995@gmail.com>
Date: Mon, 16 Jan 2023 21:45:46 +0530
Message-ID: <CAKX_gjqqLBGqgtRAyBDphOZh-=V2LBx7YdnRS0EMsnZDtve4jg@mail.gmail.com>
Subject: Difference between BITMAP_EXECUTABLE_PATH and BITMAP_EXCLUDE_EXTEND
 flags
To: Linux-audit@redhat.com
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Mailman-Approved-At: Mon, 16 Jan 2023 16:17:37 +0000
X-BeenThere: linux-audit@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux Audit Discussion <linux-audit.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-audit>,
 <mailto:linux-audit-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/linux-audit/>
List-Post: <mailto:linux-audit@redhat.com>
List-Help: <mailto:linux-audit-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-audit>,
 <mailto:linux-audit-request@redhat.com?subject=subscribe>
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed; boundary="===============4083492303195920586=="

--===============4083492303195920586==
Content-Type: multipart/alternative; boundary="00000000000012bc7305f263e63e"

--00000000000012bc7305f263e63e
Content-Type: text/plain; charset="UTF-8"

Hello All,

Please could you help me understand the difference between the following
flags which are being used?

AUDIT_FEATURE_BITMAP_EXECUTABLE_PATH
AUDIT_FEATURE_BITMAP_EXCLUDE_EXTEND

-- 
*Regards,*

*Avtansh Gupta*
*+91 8743068185*

--00000000000012bc7305f263e63e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello All,<div><br></div><div>Please=C2=A0could you help m=
e understand=C2=A0the difference between the following flags which are bein=
g used?</div><div><br></div><div>AUDIT_FEATURE_BITMAP_EXECUTABLE_PATH<br></=
div><div>AUDIT_FEATURE_BITMAP_EXCLUDE_EXTEND</div><div><div><br></div>-- <b=
r><div dir=3D"ltr" class=3D"gmail_signature" data-smartmail=3D"gmail_signat=
ure"><div dir=3D"ltr"><div><div dir=3D"ltr"><b><font color=3D"#666666">Rega=
rds,</font></b><div><font color=3D"#666666"><br></font></div><div><b><font =
color=3D"#666666">Avtansh Gupta</font></b></div><div><b><font color=3D"#666=
666">+91 8743068185</font></b></div></div></div></div></div></div></div>

--00000000000012bc7305f263e63e--

--===============4083492303195920586==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

--===============4083492303195920586==--

