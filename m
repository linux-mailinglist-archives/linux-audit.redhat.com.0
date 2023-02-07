Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 74F9368DD11
	for <lists+linux-audit@lfdr.de>; Tue,  7 Feb 2023 16:32:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1675783939;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=p/40Z00qBrHUtqJgxb7GzjGLjKLYsg6PjblvXPoxtSE=;
	b=hTcSXmMQKoiGq/fwEiSBrWXYHvWme6q+hsMncIRJLUsPNsp5XdbTFhBbM5y01eVp14OiN/
	ve34FkWfyMK/JluGdBpg5KHQesgHUo3DUh6VV01mGigzrO8zFUWgOqoKBcvriTm8V/hxCI
	VKV93AYLUMyICpsLex+dNdMRGRcLWz0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-351-U0viHvOiP3WrTfgPh71V7g-1; Tue, 07 Feb 2023 10:32:17 -0500
X-MC-Unique: U0viHvOiP3WrTfgPh71V7g-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4F775101A55E;
	Tue,  7 Feb 2023 15:32:14 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id CEFB540398A0;
	Tue,  7 Feb 2023 15:32:12 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id AB98719465A3;
	Tue,  7 Feb 2023 15:32:12 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 8B9F31946589 for <linux-audit@listman.corp.redhat.com>;
 Tue,  7 Feb 2023 15:32:11 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 6A31540398A0; Tue,  7 Feb 2023 15:32:11 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6291B40398A2
 for <linux-audit@redhat.com>; Tue,  7 Feb 2023 15:32:11 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3E7B1811E6E
 for <linux-audit@redhat.com>; Tue,  7 Feb 2023 15:32:11 +0000 (UTC)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com
 [209.85.215.181]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-86-46UemQJQMmyoZFr3XTWF8w-1; Tue, 07 Feb 2023 10:32:09 -0500
X-MC-Unique: 46UemQJQMmyoZFr3XTWF8w-1
Received: by mail-pg1-f181.google.com with SMTP id 78so10662248pgb.8
 for <linux-audit@redhat.com>; Tue, 07 Feb 2023 07:32:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mPkyWxQYeLhV/jqO2XWuwlqm6oiv9EuVhA/OJYMs84c=;
 b=I7HnZ2QyswDSkBJ71nA6NmA4RoSvROYGeQbRJp7KC/Ll0iRwC9VuC5vQ3hbtIhwfvl
 nNDrqwlP/14O7L0FUe/GrYj4fYzEbmHundiJ7OCKT9i+qtzUIDLNEBlKl2ydObk9LDD+
 mQ0ZrV5f4MyGq3n7/miRfJp9LH5uN9zyigzLMKSJq73gEzRerQ4viFLw56SomXAPJTAU
 LgTDG2G+e4LjZXq515qfKzSLosTfiJ+b5xa648aSH6g1kWHB9EOczp7WmPc5gFn14H5W
 X6LJM1TsNqjgkoFoSrEcVmbPq7JDgeWKmZeI+nHR5tyNowTARBqVYshCi40p9Z+140Dr
 tJqw==
X-Gm-Message-State: AO0yUKUAltDpU13WR3okqrTjcjpumtyIRHj8dAkjMWfmr0nZ4pbuEXJu
 6U1dRtT7vtFgzALsKsQfM62oDLWgYL+W9DMDkOHICE7HwhOI9GY=
X-Google-Smtp-Source: AK7set8VAJ4rhXxC2oEc5yiuYyYTn9mUKH3nYH62ebozLO4i9lABe4v/wh70C9J1GFTFKxUJvfoIRQ9IlYOrOSqloXM=
X-Received: by 2002:a62:64d4:0:b0:5a7:a688:cd80 with SMTP id
 y203-20020a6264d4000000b005a7a688cd80mr568523pfb.22.1675783927920; Tue, 07
 Feb 2023 07:32:07 -0800 (PST)
MIME-Version: 1.0
References: <CAHC9VhRM16vx4S+2FUcRftvt+DcPe_zASkAyAS4BSzBMFH=pog@mail.gmail.com>
 <CAHC9VhTbnCkOqpsA7f_E0PROu02Q3fi+Z-06T8GuYQg166Wo=w@mail.gmail.com>
In-Reply-To: <CAHC9VhTbnCkOqpsA7f_E0PROu02Q3fi+Z-06T8GuYQg166Wo=w@mail.gmail.com>
From: Paul Moore <paul@paul-moore.com>
Date: Tue, 7 Feb 2023 10:31:56 -0500
Message-ID: <CAHC9VhSDH_LJqw31wUh9Fw=4xdyF-vBRLcxXekiwpNULXSRQoA@mail.gmail.com>
Subject: Re: Upstream kernel development and the linux-audit mailing list
To: linux-audit@redhat.com, audit@vger.kernel.org
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Feb 3, 2023 at 11:39 AM Paul Moore <paul@paul-moore.com> wrote:
> On Tue, Jan 31, 2023 at 2:44 PM Paul Moore <paul@paul-moore.com> wrote:
> >
> > Hello all,
>
> ...
>
> > I'll hold off on list creation for a couple of days in case anyone has
> > a well reasoned argument against moving upstream kernel development to
> > a new list.  However, I want to underscore that any argument to keep
> > upstream discussions on a moderated list will need to be strong enough
> > to counter potentially excluding other subsystems from the discussion.
>
> Seeing no comments, I just sent a request off to the vger
> postmaster(s) to create a new list; I'll send another update when it
> is up and running.

The new list, audit@vger.kernel.org, is up and running and is CC'd on
this email.  While I'll continue to monitor linux-audit@redhat for
upstream Linux Kernel patch submissions for a period of time to ease
the transition, I do ask that everyone start submitting their upstream
kernel patches and bug reports to audit@vger; at some point in the
future I plan to stop monitoring linux-audit@redhat for patch
submissions, bug reports, etc.

Information on subscribing to the audit@vger list can be found below:

* http://vger.kernel.org/vger-lists.html#audit
* http://vger.kernel.org/majordomo-info.html

I'll submit a patch to update the MAINTAINERS file with the new list
address later today.

-- 
paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

