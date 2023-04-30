Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AE586F897B
	for <lists+linux-audit@lfdr.de>; Fri,  5 May 2023 21:24:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1683314698;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=+vMPtegEQdAU/iW8Zcnhvgmsgn/Vtq6i94fWW7p73IA=;
	b=Ws4xgrIK25shcE4nfz5CLRDP4ewpIaAwSMOtosU6MJHZioO9ikrEGJCT5nA/ZREWxwE10V
	AXoJGx8OisjCrwA2RdkyTxUelRewZNibTwDe0w2OHzAYBL0rVMABKHgloBg6RNa6B9LAxv
	Bvk7Mo6dMdGklnHCfazoVAVHm/BNrdo=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-428-vcSJptkhPeaanNd6p5DfCw-1; Fri, 05 May 2023 15:24:54 -0400
X-MC-Unique: vcSJptkhPeaanNd6p5DfCw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DE46C29DD98B;
	Fri,  5 May 2023 19:24:51 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 459ED2166B31;
	Fri,  5 May 2023 19:24:43 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 18E001946A4D;
	Fri,  5 May 2023 19:24:42 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id E4AEB1946586 for <linux-audit@listman.corp.redhat.com>;
 Sun, 30 Apr 2023 00:20:35 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id C8A3D1410F1E; Sun, 30 Apr 2023 00:20:35 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C0BA41410F1C
 for <linux-audit@redhat.com>; Sun, 30 Apr 2023 00:20:35 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A5426380610C
 for <linux-audit@redhat.com>; Sun, 30 Apr 2023 00:20:35 +0000 (UTC)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com
 [209.85.208.174]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-630-AjXH0X5SOKSuLIirwAjA6g-1; Sat, 29 Apr 2023 20:20:30 -0400
X-MC-Unique: AjXH0X5SOKSuLIirwAjA6g-1
Received: by mail-lj1-f174.google.com with SMTP id
 38308e7fff4ca-2a8bbea12d7so11314791fa.3; 
 Sat, 29 Apr 2023 17:20:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682814029; x=1685406029;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KA3AkPLYJ1BpZSrX/Hknhjr2RirKjavjPnTX49VdIGY=;
 b=AIxc9GV0tjOJax1veCjsqGiFtikJ+qIbxRko5BjB51uzoGeKBHwY8BQDyfWqWLvM1U
 /aY7p9l/FQdIMN2lprv53DmT4v9XxNHveN3b64RDpkXY5CEUVylC+3hmH5BMW+5vOnSm
 jG4+E+uoHglqg2CYl0XDxUcFh3zMxUQ2KJKdbWNb2Oxf6gn9S7Vi2n4SadqhdKabGJ63
 SMMeA2nMb0R23QnuOOMVb9TYWVlD7QtewJ5w6yMFeD59x5lBHMRgGRCNu7OwTdjZqpt5
 JVd0KBQmO+dzLE55b7ZVM7vxjEHnYpNyopV86S3OT62Kx2H9H2Fx13yc7RWkYSom/T0k
 5t4g==
X-Gm-Message-State: AC+VfDxTbDjPOYGJHL6xlS1rAhxaO47sTvawtLLp2h2bkwkqLmGX2qwd
 PriaChlcLFtPM3ynZh2HOHiLSceqCY0qSk8YdRaHTmRxlVk=
X-Google-Smtp-Source: ACHHUZ7mGKJnGwapMsoKZCp8DNUQYAKtK7Hw0kppXUqthoVw9zmtPOgfjRztC37kt47PaZL9YZ8l42DU1ouW2pqhEBc=
X-Received: by 2002:a2e:9f0c:0:b0:2a6:2305:110c with SMTP id
 u12-20020a2e9f0c000000b002a62305110cmr2386241ljk.38.1682814028328; Sat, 29
 Apr 2023 17:20:28 -0700 (PDT)
MIME-Version: 1.0
References: <CABvEhECpywJRHDW6dFZU8Q3_rCZ0MpG45UQVu8fgH7ENSK37dA@mail.gmail.com>
 <4526563.LvFx2qVVIh@x2>
In-Reply-To: <4526563.LvFx2qVVIh@x2>
From: =?UTF-8?B?5rGf5p2o?= <jiangyang.me@gmail.com>
Date: Sun, 30 Apr 2023 08:20:16 +0800
Message-ID: <CABvEhEART=nT0Nnt27LwaYmK5SAnUhuA-U9k2uFVio+GX6qwBQ@mail.gmail.com>
Subject: Re: "service auditd start" fails inside a container
To: Steve Grubb <sgrubb@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mailman-Approved-At: Fri, 05 May 2023 19:24:40 +0000
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
Cc: linux-audit@redhat.com
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: gmail.com
Content-Type: multipart/mixed; boundary="===============1751110098308434690=="

--===============1751110098308434690==
Content-Type: multipart/alternative; boundary="00000000000061b2a005fa82ac64"

--00000000000061b2a005fa82ac64
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thank you for your information.

Steve Grubb <sgrubb@redhat.com> =E4=BA=8E2023=E5=B9=B44=E6=9C=8829=E6=97=A5=
=E5=91=A8=E5=85=AD 02:49=E5=86=99=E9=81=93=EF=BC=9A

> On Friday, April 28, 2023 3:54:32 AM EDT =E6=B1=9F=E6=9D=A8 wrote:
> > May I ask if Auditd supports Docker? Thank you
> > https://listman.redhat.com/archives/linux-audit/2018-July/msg00078.html
>
> There is no active work that I know of to put auditd in a container. It's
> libraries are used by many applications. So, I don't know what use it
> would
> be to containerize it.
>
> And if you are asking if auditd can audit events in a container, I think
> that
> answer is also no.
>
> -Steve
>
>
>

--00000000000061b2a005fa82ac64
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thank you for your information.=C2=A0<br></div><br><div cl=
ass=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Steve Grubb &lt;<=
a href=3D"mailto:sgrubb@redhat.com">sgrubb@redhat.com</a>&gt; =E4=BA=8E2023=
=E5=B9=B44=E6=9C=8829=E6=97=A5=E5=91=A8=E5=85=AD 02:49=E5=86=99=E9=81=93=EF=
=BC=9A<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Friday=
, April 28, 2023 3:54:32 AM EDT =E6=B1=9F=E6=9D=A8 wrote:<br>
&gt; May I ask if Auditd supports Docker? Thank you<br>
&gt; <a href=3D"https://listman.redhat.com/archives/linux-audit/2018-July/m=
sg00078.html" rel=3D"noreferrer" target=3D"_blank">https://listman.redhat.c=
om/archives/linux-audit/2018-July/msg00078.html</a><br>
<br>
There is no active work that I know of to put auditd in a container. It&#39=
;s <br>
libraries are used by many applications. So, I don&#39;t know what use it w=
ould <br>
be to containerize it.<br>
<br>
And if you are asking if auditd can audit events in a container, I think th=
at <br>
answer is also no.<br>
<br>
-Steve<br>
<br>
<br>
</blockquote></div>

--00000000000061b2a005fa82ac64--

--===============1751110098308434690==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

--===============1751110098308434690==--

