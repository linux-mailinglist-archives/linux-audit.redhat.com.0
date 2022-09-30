Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D93C5F11CE
	for <lists+linux-audit@lfdr.de>; Fri, 30 Sep 2022 20:48:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1664563708;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ImdtaAWpqq1vFmzd7lyBWK2Itc2lCO2Ul85h3tNG1nU=;
	b=Uem1GGOJzP1GAR5XSoiKm8W2F/QvCDR0vVGpmEbDNKqcTFV/uXNAzEgAcgQzyISiGenWPY
	Eh0Mgp/YBtccGKKUm26j26GdYOpGSEB4F2/ZGGn3QMErFoK6N0izCGK4jvjCCRmbn7uQQa
	+I/C9T4MjurKnukul3ALAO6r4kT9E+Q=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-304-s79jRhduMzGZg5QXOB3JuQ-1; Fri, 30 Sep 2022 14:48:24 -0400
X-MC-Unique: s79jRhduMzGZg5QXOB3JuQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 157F1862FDC;
	Fri, 30 Sep 2022 18:48:23 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 31651140EBF3;
	Fri, 30 Sep 2022 18:48:21 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id ACD031946A70;
	Fri, 30 Sep 2022 18:48:20 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 60C6F1946A52 for <linux-audit@listman.corp.redhat.com>;
 Fri, 30 Sep 2022 18:48:19 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 434CB492B06; Fri, 30 Sep 2022 18:48:19 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3B9BC492B04
 for <linux-audit@redhat.com>; Fri, 30 Sep 2022 18:48:19 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1ED93862FDF
 for <linux-audit@redhat.com>; Fri, 30 Sep 2022 18:48:19 +0000 (UTC)
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com
 [209.85.160.44]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-427-z9YXIP6bOIuEHCBgfb4q3Q-1; Fri, 30 Sep 2022 14:48:17 -0400
X-MC-Unique: z9YXIP6bOIuEHCBgfb4q3Q-1
Received: by mail-oa1-f44.google.com with SMTP id
 586e51a60fabf-131b7bb5077so6471621fac.2
 for <linux-audit@redhat.com>; Fri, 30 Sep 2022 11:48:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=apLaD9dZYgcCgeaaq4NLy24NMK1+qDu2uk9Le0m4zZY=;
 b=u7rQXILlSObB2EK402WJdCl6cFLX3kLz+s3PJl/icpxQw4R8zrQcXXvkrZwed1NuVt
 B0PflQGXnh2i3vRYAB3OGsac5D+0E95nFzEJmvFgd9hBIj9qPLSiUZZLw+Uha/40/Zbq
 3F/ukcJruVcrTYztQVvFRkvYdtn1ytbnR/nWdDsOGHzKuiU8AMjtOGvndAk1Cu2QT1pS
 xCFr32hd83xNIUkKo0+UaJAaUTJryCKjiP8xooBfwk9rYFijomf+cyAG18BbvZNraG9f
 SrC628lPIX+TsG0hPrcSRJGkX8zH13t4aemlgLrxt4erZl3KfFWZvYOLkj5t+6oVN3pF
 aX9w==
X-Gm-Message-State: ACrzQf2czXO5HLcXdihPOVUPqtRzx1R9pachIr2SChsniPthkwhXhV7y
 0vTXndMxg5Lu4HDRPjc/+WPS3zSsQ7Ej+73ZAE8n
X-Google-Smtp-Source: AMsMyM437R9944hWYrWRP0SUIqACrElC+aRZcBMuuRBVk4RU5RAUNRM5fOXvl7AX8ljmk+WGeGTrT809DCwPGiIS2kQ=
X-Received: by 2002:a05:6870:a916:b0:131:9361:116a with SMTP id
 eq22-20020a056870a91600b001319361116amr5603254oab.172.1664563695865; Fri, 30
 Sep 2022 11:48:15 -0700 (PDT)
MIME-Version: 1.0
References: <20220927225944.2254360-1-ankur.a.arora@oracle.com>
 <20220927225944.2254360-3-ankur.a.arora@oracle.com>
 <CAHC9VhRBuBiuf6917fpP7n+Sy5fFTpzzEqRXfMGPCbnNU4jswg@mail.gmail.com>
 <8735cagcgi.fsf@oracle.com>
In-Reply-To: <8735cagcgi.fsf@oracle.com>
From: Paul Moore <paul@paul-moore.com>
Date: Fri, 30 Sep 2022 14:48:04 -0400
Message-ID: <CAHC9VhTQ8HR4ZF1VNCwuFabTUU+Y+ooeDuSwNTozuWMo4RbgSw@mail.gmail.com>
Subject: Re: [PATCH 2/3] audit: annotate branch direction for audit_in_mask()
To: Ankur Arora <ankur.a.arora@oracle.com>
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
Cc: boris.ostrovsky@oracle.com, linux-audit@redhat.com,
 linux-kernel@vger.kernel.org, eparis@redhat.com, konrad.wilk@oracle.com
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Sep 29, 2022 at 4:20 PM Ankur Arora <ankur.a.arora@oracle.com> wrote:
> Paul Moore <paul@paul-moore.com> writes:
> > I generally dislike merging likely()/unlikely() additions to code
> > paths that can have varying levels of performance depending on runtime
> > configuration.
>
> I think that's fair, and in this particular case the benchmark is quite
> contrived.
>
> But, just to elaborate a bit more on why that unlikely() clause made
> sense to me: it seems to me that audit typically would be triggered for
> control syscalls and the ratio between control and non-control ones
> would be fairly lopsided.

I understand, and there is definitely some precedence in the audit
code for using likely()/unlikely() in a manner similar as you
described, but I'll refer to my previous comments - it's not something
I like.  As a general rule, aside from the unlikely() calls in the
audit wrappers present in include/linux/audit.h I would suggest not
adding any new likely()/unlikely() calls.

> Let me see if I can rewrite the conditional in a different way to get a
> similar effect but I suspect that might be even more compiler dependent.

I am okay with ordering conditionals to make the common case the
short-circuit case.

> Also, let me run the audit-testsuite this time. Is there a good test
> there that you would recommend that might serve as a more representative
> workload?

Probably not.  The audit-testsuite is intended to be a quick, easy to
run regression test that can be used by developers to help reduce
audit breakage.  It is not representative of any particular workload,
and is definitely not comprehensive (it is woefully lacking in several
areas unfortunately).

-- 
paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

