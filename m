Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 4329C214D8C
	for <lists+linux-audit@lfdr.de>; Sun,  5 Jul 2020 17:12:07 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-468-VgPIL0Y1MreHpo0lWJiMFg-1; Sun, 05 Jul 2020 11:12:04 -0400
X-MC-Unique: VgPIL0Y1MreHpo0lWJiMFg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ED9758014D4;
	Sun,  5 Jul 2020 15:11:59 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D3B6D6E6E4;
	Sun,  5 Jul 2020 15:11:59 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id AC62E6C9EC;
	Sun,  5 Jul 2020 15:11:59 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 065FBuEY028671 for <linux-audit@listman.util.phx.redhat.com>;
	Sun, 5 Jul 2020 11:11:57 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id A2602208DD88; Sun,  5 Jul 2020 15:11:56 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 71660208DD84
	for <linux-audit@redhat.com>; Sun,  5 Jul 2020 15:11:55 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8439A8EF3AA
	for <linux-audit@redhat.com>; Sun,  5 Jul 2020 15:11:55 +0000 (UTC)
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com
	[209.85.208.66]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-67-pXmtZSF2OJajGmZV5Eybww-1; Sun, 05 Jul 2020 11:11:53 -0400
X-MC-Unique: pXmtZSF2OJajGmZV5Eybww-1
Received: by mail-ed1-f66.google.com with SMTP id z17so32360682edr.9
	for <linux-audit@redhat.com>; Sun, 05 Jul 2020 08:11:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=KEtBGKGu7+F7kv2SoCb+jcPQSY3d8v9OKOQZlWY0FOw=;
	b=f31KEbBJIr3NhBkrZHVK1pAupY7ap8DjBtL/js9emDRj00+xAja2ec95gNDLejUgM6
	85y7mRIq36uA4x5Ty9LbcUoLWfLMLUZd2/MS6tVKhTlX5s6LA3EoR4ZJ6Gfe8Vp5nfsU
	iA5Qhj/XJKlQ+ZTqmOjH13/UFQCtO37kkolW5Zhdelz04yxfIByhAbS6M+dUXGuke1c6
	MeiG2VZ/i0qztA3fy/iVgCRW8ffCN6GeE+RRH6sWaAAsyTT+mHODCsKQ5x8Zq7PZHTlK
	nsBm0fgrZzHcOVl4BXDlkr36yEbF+k5+X+mnhISGMs3Lo0JZtTCBBEHw3v/MmX+ahjGv
	CI7w==
X-Gm-Message-State: AOAM530A18bZuHtaT4rnAe1LzsRzGA0CdBvgtPXhNMD3SldaQibaarHE
	Wd+YbdCQ/FwPYtVoKfgwWE8cOZZz4vqdjEuXeGDD
X-Google-Smtp-Source: ABdhPJyxEw+kqzFSwys8tQ8mezUCXkLSxfhtpjmtIc6SHLfqNuWzPVC+Pu8lGM/GQauxfK+ZBDG3aPYWtwY05QusqCU=
X-Received: by 2002:a05:6402:742:: with SMTP id
	p2mr31354555edy.135.1593961912251; 
	Sun, 05 Jul 2020 08:11:52 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1593198710.git.rgb@redhat.com>
	<1d793e2fc60650de4bbc9f4bde3c736c94efe9a1.1593198710.git.rgb@redhat.com>
In-Reply-To: <1d793e2fc60650de4bbc9f4bde3c736c94efe9a1.1593198710.git.rgb@redhat.com>
From: Paul Moore <paul@paul-moore.com>
Date: Sun, 5 Jul 2020 11:11:40 -0400
Message-ID: <CAHC9VhRU9+h-hXKJTuMnZfyOgiktOPMRzzgAP7+VSXV7COjJuw@mail.gmail.com>
Subject: Re: [PATCH ghak90 V9 12/13] audit: track container nesting
To: Richard Guy Briggs <rgb@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: linux-audit@redhat.com
Cc: nhorman@tuxdriver.com, linux-api@vger.kernel.org,
	containers@lists.linux-foundation.org,
	LKML <linux-kernel@vger.kernel.org>, dhowells@redhat.com,
	Linux-Audit Mailing List <linux-audit@redhat.com>,
	netfilter-devel@vger.kernel.org, ebiederm@xmission.com,
	simo@redhat.com, netdev@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	Eric Paris <eparis@parisplace.org>, mpatel@redhat.com,
	Serge Hallyn <serge@hallyn.com>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sat, Jun 27, 2020 at 9:23 AM Richard Guy Briggs <rgb@redhat.com> wrote:
>
> Track the parent container of a container to be able to filter and
> report nesting.
>
> Now that we have a way to track and check the parent container of a
> container, modify the contid field format to be able to report that
> nesting using a carrat ("^") modifier to indicate nesting.  The
> original field format was "contid=<contid>" for task-associated records
> and "contid=<contid>[,<contid>[...]]" for network-namespace-associated
> records.  The new field format is
> "contid=<contid>[,^<contid>[...]][,<contid>[...]]".

I feel like this is a case which could really benefit from an example
in the commit description showing multiple levels of nesting, with
some leaf audit container IDs at each level.  This way we have a
canonical example for people who want to understand how to parse the
list and properly sort out the inheritance.


> Signed-off-by: Richard Guy Briggs <rgb@redhat.com>
> ---
>  include/linux/audit.h |  1 +
>  kernel/audit.c        | 60 ++++++++++++++++++++++++++++++++++++++++++---------
>  kernel/audit.h        |  2 ++
>  kernel/auditfilter.c  | 17 ++++++++++++++-
>  kernel/auditsc.c      |  2 +-
>  5 files changed, 70 insertions(+), 12 deletions(-)

--
paul moore
www.paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

