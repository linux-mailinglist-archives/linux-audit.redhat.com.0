Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A59B65F04C
	for <lists+linux-audit@lfdr.de>; Thu,  5 Jan 2023 16:42:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1672933336;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=v73qGN25sYRBEBHdFQMMmxhjywDkyOcLxmGPdpih3fY=;
	b=cXOE/ushNgvl6XUK6ws6d7aIv7iqdrDfhHnskfRBo7aFh8Ucducl3jFq9clCYzgqdHmirC
	Zj/AMxAhFLe+SKwPXgm8GzhqJy1e5DHOHcO784lGLkpWVjleYLZyBeiFXYEpZJdQPOJ7uQ
	oMNdW4ibn35ODa5x9FH19zxHKdGJjXU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-358-Y-HKyngIPem-le0KTeG6Lg-1; Thu, 05 Jan 2023 10:42:15 -0500
X-MC-Unique: Y-HKyngIPem-le0KTeG6Lg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 584AC3814957;
	Thu,  5 Jan 2023 15:42:13 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C1C772166B30;
	Thu,  5 Jan 2023 15:42:07 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id C204B19465A0;
	Thu,  5 Jan 2023 15:42:06 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 0978E1946586 for <linux-audit@listman.corp.redhat.com>;
 Thu,  5 Jan 2023 15:42:03 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id BC1A3492B07; Thu,  5 Jan 2023 15:42:03 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B55C4492B06
 for <linux-audit@redhat.com>; Thu,  5 Jan 2023 15:42:03 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9A76980D0E5
 for <linux-audit@redhat.com>; Thu,  5 Jan 2023 15:42:03 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com
 [209.85.210.169]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-656-D2_rcOGlOii1s1aYvurjiw-1; Thu, 05 Jan 2023 10:42:01 -0500
X-MC-Unique: D2_rcOGlOii1s1aYvurjiw-1
Received: by mail-pf1-f169.google.com with SMTP id x26so19354527pfq.10
 for <linux-audit@redhat.com>; Thu, 05 Jan 2023 07:42:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+Uaw5QMJKNQY6971izD3kqPCo0v11b60tz21pLOpFPA=;
 b=BjhKlUEP63/riKvZHqs18nO6qf0Ni7i7J2FWc1fHrg+t3ht2L8K8yT5qbE7NrBorCx
 zz3R/thinjvAPgwhbycosvOEM56ELWbC/yhvj5Yn4LAmwQI+ppz1tHp39XK3+viiMtgA
 WuZodxyC3mHdAQo3TkBiiq7DJYFL1iBrz5Zrir7lcQ22R8C4+C5j3rP7vgabVE4/xZsS
 P6pEwapasbHwiObLoTCPxejzDRlCVzCGDpcN1tnrv7ECcta+Z5xN1OOdi18NCIRjvrvp
 WRl2ECEtNIMz/dkAVn720kSyc4q2KlBfK9D0egI0bKs5a93hUaexiUJU21+RDK1v5798
 T+Pg==
X-Gm-Message-State: AFqh2kq6eBJD/YWXb2z8fMlsL5cS/1cNGdXYj/TmaTdgHM8Msa3yWE/+
 T3NPTVG7Dim5iPEdehNPa+AiC9kHkmOSEevcLHfv
X-Google-Smtp-Source: AMrXdXvQiXDsDtMAsb/7XjFxjsIAGZHap9oUCZElp2d+e+ai2KNgnOClip0xxrR++q5heTVqjR4MDxkT/Et1TgTYFwc=
X-Received: by 2002:a63:4e5d:0:b0:478:42f:5a3d with SMTP id
 o29-20020a634e5d000000b00478042f5a3dmr3164821pgl.3.1672933320745; Thu, 05 Jan
 2023 07:42:00 -0800 (PST)
MIME-Version: 1.0
References: <CACKMdf=43CJmauoVnyzemsGtJoR5g=yDUUojJ3P1qsbKrrNMXQ@mail.gmail.com>
In-Reply-To: <CACKMdf=43CJmauoVnyzemsGtJoR5g=yDUUojJ3P1qsbKrrNMXQ@mail.gmail.com>
From: Paul Moore <paul@paul-moore.com>
Date: Thu, 5 Jan 2023 10:41:49 -0500
Message-ID: <CAHC9VhQ10FeuFYqhC31YCmU9BB67go3RoMOsYn+SWA5TsWKy9w@mail.gmail.com>
Subject: Re: New bug in Audit
To: Ariel Silver <arielsilver77@gmail.com>
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
Cc: linux-audit@redhat.com
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Jan 5, 2023 at 8:38 AM Ariel Silver <arielsilver77@gmail.com> wrote:
> I found the following bug:
>
> OS version = Red Hat Enterprise Linux release 8.6 (Ootpa)
> Kernel version = 4.18.0-425.3.1.el8.x86_64
> auditctl version = 3.0.7

This mailing list is focused on the development and support of
upstream Linux Kernels and Steve's audit userspace, we don't really
provide support for paid distributions.  If you are seeing problems
with the upstream Linux Kernel or tools, please report them here, but
issues with distribution kernels and/or tools should be sent to the
distribution for support/assistance.

I believe you should be able to submit a bug report against Red Hat
Enterprise Linux using the Red Hat bugzilla instance at the URL below:

* https://bugzilla.redhat.com

-- 
paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

