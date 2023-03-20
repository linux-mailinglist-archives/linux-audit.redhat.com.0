Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 52E196C16ED
	for <lists+linux-audit@lfdr.de>; Mon, 20 Mar 2023 16:10:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1679325015;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=erHOcDe31MP8y6czPTHZoYsTqxTIVgz+xrWXHOk6Vlk=;
	b=Qfzd15tcs9/zQ2JgNOAjwjkFbQ2jepjxXf5GrtBdHuMCVPY8eFsCGShIJ24F7FcMjNGKLC
	6dAEtGLtJFhNoSxpO71hDtxUyOEBh4dFfFppd0ISdnIiXSiCfbQhmNiiAMIqZe2R1gcPbV
	NX/8HHwwKDQWybhR3ILKkENEuQKp/XA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-20-s0wqv07rPqm7m_AygmVajw-1; Mon, 20 Mar 2023 11:10:14 -0400
X-MC-Unique: s0wqv07rPqm7m_AygmVajw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E662C884EC1;
	Mon, 20 Mar 2023 15:10:11 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4C8F7C15A0B;
	Mon, 20 Mar 2023 15:10:03 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id E413219465B9;
	Mon, 20 Mar 2023 15:10:02 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 124631946594 for <linux-audit@listman.corp.redhat.com>;
 Mon, 20 Mar 2023 15:10:02 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id C1F51483EC4; Mon, 20 Mar 2023 15:10:01 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BB03C4021B1
 for <linux-audit@redhat.com>; Mon, 20 Mar 2023 15:10:01 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9FF2B85530E
 for <linux-audit@redhat.com>; Mon, 20 Mar 2023 15:10:01 +0000 (UTC)
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com
 [209.85.222.46]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-428-5IeU-6H9PECSiSNisZcJbg-1; Mon, 20 Mar 2023 11:09:59 -0400
X-MC-Unique: 5IeU-6H9PECSiSNisZcJbg-1
Received: by mail-ua1-f46.google.com with SMTP id s23so8121333uae.5
 for <Linux-audit@redhat.com>; Mon, 20 Mar 2023 08:09:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679324999;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xpSrmmeachrfRWeIdwX0SqcpyUSw5SwzkNevnUepoUY=;
 b=1Aem4Yf7wDs0NptAictIhm81dFJB87Y+g2u9epkod4bGCh3knTuAK05gYXaBU2WzQc
 zAbXsk9ucBVYDsCd2dxDvq7cxa1/T08zZ16MsXvNdGe2AGBOWG9CvZPXdnL7mGk7DyUz
 B0pssupOBnMSvRilUWivfzsUAyPbvQv8aRmc8SPgHsim13CttjDb9jOMJDhvcCWiJ5X6
 LlXWRppP2kPPbao2moFpdHXYk9yDwSMTw0IrMfRDxybCMsOA8WEtW0vWaR1ojEFUo56A
 ef/Mrxwg+Wxu/KZUYfTGnnrtC26p8m6p7CtFH4Lcch/a80De3Ec4/OKR8MQwChJB/Cye
 lv2g==
X-Gm-Message-State: AO0yUKXw6Xt3qlC4BDu/C1AAORKhkwrNVEXuFKpoWd4oyv6dDF48a4PC
 M2GTVJHkQ2H2khnELtKOjJgYEfkL5ZU28Zsw7LSdsC2LwTwF2w==
X-Google-Smtp-Source: AK7set/trSa4K25je9bnrdKEPzFUcANQzkxGuum6M9y3TOStXde/2wiQ+mzsT7P/zXN64c+hiKeDH8rF6fRpaN3L6t0=
X-Received: by 2002:a1f:9fc6:0:b0:436:5000:ed97 with SMTP id
 i189-20020a1f9fc6000000b004365000ed97mr2498620vke.2.1679324998913; Mon, 20
 Mar 2023 08:09:58 -0700 (PDT)
MIME-Version: 1.0
References: <CAPoNrtsy+ckCHQZGYM-8DW3S3FckABGyZtvVG3LJPDT8PLzMUQ@mail.gmail.com>
 <CAHC9VhTPYw_YprXkZ2h-XAg3WGsqkTxBVzZiyo0XOaRmmeC71w@mail.gmail.com>
In-Reply-To: <CAHC9VhTPYw_YprXkZ2h-XAg3WGsqkTxBVzZiyo0XOaRmmeC71w@mail.gmail.com>
From: Anurag Aggarwal <anurag19aggarwal@gmail.com>
Date: Mon, 20 Mar 2023 20:39:47 +0530
Message-ID: <CAPoNrturZV58xESCvCOg5PQbHkf0reJvAbbLJ6-fJa003xxnjw@mail.gmail.com>
Subject: Re: Help with setting up Auditd kernel repository
To: Paul Moore <paul@paul-moore.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
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
Cc: Linux-audit@redhat.com
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

>
> Can you be more specific about the exact repository?  There is a
> repository which contains the development code for the Linux Kernel's
> audit subsystem, and there is a second repository which contains
> Steve's audit userspace code (which contains auditd as a component).
> There is no combined "auditd-kernel" repository.
>

Yes Paul, the repository that I am talking about is:
https://github.com/linux-audit/audit-kernel

I have separately cloned Steve's audit userspace code and I am able to build it.


-- 
Anurag Aggarwal

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

