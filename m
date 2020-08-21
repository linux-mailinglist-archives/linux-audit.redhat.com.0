Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id CCA6624E2F3
	for <lists+linux-audit@lfdr.de>; Sat, 22 Aug 2020 00:03:55 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-137-ufG-CO1vPuqUenMECmNY-w-1; Fri, 21 Aug 2020 18:03:52 -0400
X-MC-Unique: ufG-CO1vPuqUenMECmNY-w-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5E4D71876531;
	Fri, 21 Aug 2020 22:03:48 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2157A5C1D0;
	Fri, 21 Aug 2020 22:03:48 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9E2121832FC2;
	Fri, 21 Aug 2020 22:03:47 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07LM3gtt030300 for <linux-audit@listman.util.phx.redhat.com>;
	Fri, 21 Aug 2020 18:03:42 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 612A6106248; Fri, 21 Aug 2020 22:03:42 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5AEF2106A3F
	for <linux-audit@redhat.com>; Fri, 21 Aug 2020 22:03:40 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1AC69856F6D
	for <linux-audit@redhat.com>; Fri, 21 Aug 2020 22:03:40 +0000 (UTC)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com
	[209.85.208.53]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-99-sgayxE_yNI-ymwoNBF9OPQ-1; Fri, 21 Aug 2020 18:03:38 -0400
X-MC-Unique: sgayxE_yNI-ymwoNBF9OPQ-1
Received: by mail-ed1-f53.google.com with SMTP id bs17so2819185edb.1
	for <linux-audit@redhat.com>; Fri, 21 Aug 2020 15:03:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=qsMMjQeJjWul0TsptEKEHNkWIjVY3MMW6ig7IJ9MCBQ=;
	b=qdIYsZe3orr56LCypHNwqwU/Rn4KBXDZLGWaz4Kq8IHOK5vwe7RWqHQiq4SoKwXVFj
	Lo/S4iAmqb/8IH6c+2ho10diRm40NA5yV9grD8WJxPs1RM3DAbGpZ1HlCt7I/hTV01/x
	t1Zo+nFByrOtOG21sJs6HTiGXbpEekg9J2pbDKcSZm7oJMzKiYSmOZ5QqQjpdWv9BWah
	nyH9cLc4cseccZvPf/ef28tV3LRlB04zzfuDYMa2P8RkammoVNDzsfiYvO88AGQrP7fp
	BHXLWB7VKVISbNUBpPKjZP0QBen5Sd2RhRSHheHU6Zp1OnZmoSI+Z3I4es+PmZEUWLjL
	un4A==
X-Gm-Message-State: AOAM532U6qiLyAktOkkuNRpb3oU7lQaAZS+y580RE9cE/ltBTFyKbFNG
	yK/WUeviIaapKUu+7b2kYlR6T5P5yqipCZZCUjViZN+aKMVT
X-Google-Smtp-Source: ABdhPJwvW+wzqjftB/sg8qThqGuNRor0vRVw+XBqbVgkV+HAJvi6hFieVxdnh7ea71U0i18QPkRL6/bWIM9hnNatjUM=
X-Received: by 2002:aa7:c383:: with SMTP id k3mr4804671edq.164.1598047416485; 
	Fri, 21 Aug 2020 15:03:36 -0700 (PDT)
MIME-Version: 1.0
References: <CAHC9VhQXYuS8_tK6NQxXw-cn_+6xJ=RMD_9u=z=DFjgSi=pF2Q@mail.gmail.com>
	<4fcd8835-9239-cba6-e13d-3d00a88b2290@schaufler-ca.com>
In-Reply-To: <4fcd8835-9239-cba6-e13d-3d00a88b2290@schaufler-ca.com>
From: Paul Moore <paul@paul-moore.com>
Date: Fri, 21 Aug 2020 18:03:25 -0400
Message-ID: <CAHC9VhSX-=K6fpDoV6J5aWZDr7_9V3R5WqJu47Zwo=D6G4dcWQ@mail.gmail.com>
Subject: Re: Administrivia
To: Casey Schaufler <casey@schaufler-ca.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: linux-audit@redhat.com
Cc: linux-audit@redhat.com
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
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Aug 21, 2020 at 5:56 PM Casey Schaufler <casey@schaufler-ca.com> wrote:
> On 8/21/2020 2:35 PM, Paul Moore wrote:
> > A heads-up that I've replaced the "master" branch in the audit
> > kernel repo with the "main" branch.  This should have little to no
> > practical impact, but if you run into problems let me know.
>
> Sounds ominous. Why the change?

It was time the repo used some better terminology for branch names.  I
tried earlier in the year, but the infrastructure wasn't cooperating;
the kernel.org folks recently fixed that so I went ahead and made the
change.

-- 
paul moore
www.paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

