Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id F2B6570E962
	for <lists+linux-audit@lfdr.de>; Wed, 24 May 2023 01:12:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1684883560;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=9rMwPWSBOqenT2bhNDycGDRynz81LpIvamLAdgUZVMs=;
	b=O5OO31aKGloanJxM0NMBUrNspGLMax4bOTssNQQp/X6oM6zMnx2lcnI7KYUhkSZb5EIHtE
	vtvTh0Jlx84dfoM/o0BF8QkEBG2/uyIY7oLK8ssAMByW930QVtUaWCUDXsde4iS1KqvORh
	QCC0LcXaIRC80VOYhLjRlUqiJo24P9g=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-657-UJOaVEUYP0yTLuv4AcP-VA-1; Tue, 23 May 2023 19:12:37 -0400
X-MC-Unique: UJOaVEUYP0yTLuv4AcP-VA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3C48629AA2C1;
	Tue, 23 May 2023 23:12:35 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 32FE4492B0B;
	Tue, 23 May 2023 23:12:26 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 7500619465B9;
	Tue, 23 May 2023 23:12:24 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 9F22219465A0 for <linux-audit@listman.corp.redhat.com>;
 Tue, 23 May 2023 23:12:23 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 89EA6482060; Tue, 23 May 2023 23:12:23 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 82A68400F17
 for <linux-audit@redhat.com>; Tue, 23 May 2023 23:12:23 +0000 (UTC)
Received: from us-smtp-inbound-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 67AFB185A78E
 for <linux-audit@redhat.com>; Tue, 23 May 2023 23:12:23 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com
 [209.85.218.42]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-558-FCF1jvcwOI2sx599i-yD2A-1; Tue, 23 May 2023 19:12:21 -0400
X-MC-Unique: FCF1jvcwOI2sx599i-yD2A-1
Received: by mail-ej1-f42.google.com with SMTP id
 a640c23a62f3a-96fdc081cb3so29087266b.2
 for <linux-audit@redhat.com>; Tue, 23 May 2023 16:12:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684883540; x=1687475540;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=2FrRSkZx2AyqT05pKe6ODfA1VhMcqeFX6GNEbxEnqHc=;
 b=TRPRQwe+SUmuxzpl5w40BKxLcxT9vqGEb/YV8z7IigvhOnyd9KflqjptMWKXV+o/P9
 4ETIWADxL0gaiTicR1rafh0/FtTGOEVQKWuF8l6dmoRkmmtncXvdzxcQAU6m1bEQ3TJ2
 kSjbJtzkEVHiZKqlcj8giJUKtmoaPmz/nwTZ/Gx+5YdT4HClU7/9obBxU1CiRdWs6HEs
 ZuEgQkqFrLlX+62Pq9UQGAJq5LaXVxSubwLAcJQUtCrKwjeHOwV8ecczQO8bnZvcqGQd
 ZuNjnmDNIPLmC1tSBTmEBScEXiNWPqHhTDDd+ilnqgrwkVz2HZlcCBz8kQtyr42c/mgD
 OnpA==
X-Gm-Message-State: AC+VfDwxntYsMdwHpwen+h2ZPUkx5rUR9rCIp8lcjyvmKrIz8VkvaGFA
 vNNG8Zb81E4p8jjSWqP+SAmOyv4fDwrrCaxpHATAEHzOtL8=
X-Google-Smtp-Source: ACHHUZ4XnJbnYigea7gbbIpk2te0R5mb7MT6yV9vINXH+ICaBPP+pTiEhPUbPgW+gxviX9A/YnsKYlLmeLJiQ1IeaS4=
X-Received: by 2002:a17:907:c26:b0:94f:356d:cd0 with SMTP id
 ga38-20020a1709070c2600b0094f356d0cd0mr20661081ejc.33.1684883539549; Tue, 23
 May 2023 16:12:19 -0700 (PDT)
MIME-Version: 1.0
From: "warron.french" <warron.french@gmail.com>
Date: Tue, 23 May 2023 19:12:07 -0400
Message-ID: <CAJdJdQnpmK3uN7R_CNQs3+HdLKfswgQpqT95+O0_Bawc7zMKHw@mail.gmail.com>
Subject: No more report of quantity of rules successfully loaded
To: Linux Audit <linux-audit@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: gmail.com
Content-Type: multipart/mixed; boundary="===============4733701703747419548=="

--===============4733701703747419548==
Content-Type: multipart/alternative; boundary="000000000000dce08205fc6484b5"

--000000000000dce08205fc6484b5
Content-Type: text/plain; charset="UTF-8"

Hi, I am running auditd-3.0.7-4 on an Alma Linux v8.8.

I know that for all of RHEL 6 and RHEL 7 variants that I worked with, to
include CentOS (not Stream) that after I rebooted a server or restarted the
auditd service (with -e 1 set) that I would 100% of the time get a report
in /var/log/messages about the quantity of rules that successfully loaded.

I could compare that to my unified rules file
(/etc/audit/rules.d/Unified.rules - for a reference) and strip out the
typical for auditd Control rules (-D, -e 1, -f 1, -b, -r, for examples) and
then assess if I had the full set of files loaded or not.

With this implementation of auditd, on version 3.0.7-4, I am not getting
those results anymore.
Am I looking in the wrong place, because for me this is important
information?

Yes, I know that I can also manually execute "auditctl -l  | wc -l" and get
that information  too, but I was wondering if this is planned or if I am
looking in the wrong place, or what to do.


Thanks,
--------------------------
Warron French

--000000000000dce08205fc6484b5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi, I am running=C2=A0auditd-3.0.7-4 on an Alma Linux=
 v8.8.</div><div><br></div><div>I know that for all of RHEL 6 and RHEL 7 va=
riants that I worked with, to include CentOS (not Stream) that after I rebo=
oted a server or restarted the auditd service (with -e 1 set) that I would =
100% of the time get a report in /var/log/messages about the quantity of ru=
les that successfully loaded.</div><div><br></div><div>I could compare that=
 to my unified rules file (/etc/audit/rules.d/Unified.rules - for a referen=
ce) and strip out the typical for auditd Control rules (-D, -e 1, -f 1, -b,=
 -r, for examples) and then assess if I had the full set of files loaded or=
 not.</div><div><br></div><div>With this implementation of auditd, on versi=
on 3.0.7-4, I am not getting those results anymore.</div><div>Am I looking =
in the wrong place, because for me this is important information?</div><div=
><br></div><div>Yes, I know that I can also manually execute &quot;auditctl=
 -l=C2=A0 | wc -l&quot; and get that information=C2=A0 too, but I was wonde=
ring if this is planned or if I am looking in the wrong place, or what to d=
o.</div><div><br></div><div><br></div><div>Thanks,</div><div><div dir=3D"lt=
r" class=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div dir=3D=
"ltr">--------------------------<br><font color=3D"#000099" size=3D"4">Warr=
on French<br><font size=3D"4"><font size=3D"4"><font size=3D"4"><br></font>=
</font></font></font></div></div></div></div>

--000000000000dce08205fc6484b5--

--===============4733701703747419548==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

--===============4733701703747419548==--

