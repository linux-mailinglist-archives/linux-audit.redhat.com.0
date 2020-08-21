Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 25CBC24E1F8
	for <lists+linux-audit@lfdr.de>; Fri, 21 Aug 2020 22:15:51 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-480-_kzDpw1fP3eDxSZlVu9JyA-1; Fri, 21 Aug 2020 16:15:47 -0400
X-MC-Unique: _kzDpw1fP3eDxSZlVu9JyA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EBECB1074658;
	Fri, 21 Aug 2020 20:15:42 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3929471780;
	Fri, 21 Aug 2020 20:15:42 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D6764181A869;
	Fri, 21 Aug 2020 20:15:40 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07LKE4xU017883 for <linux-audit@listman.util.phx.redhat.com>;
	Fri, 21 Aug 2020 16:14:04 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 075CD2017E80; Fri, 21 Aug 2020 20:14:04 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 02A292022798
	for <linux-audit@redhat.com>; Fri, 21 Aug 2020 20:14:01 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B2DC989CD47
	for <linux-audit@redhat.com>; Fri, 21 Aug 2020 20:14:01 +0000 (UTC)
Received: from mail-ej1-f68.google.com (mail-ej1-f68.google.com
	[209.85.218.68]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-277-UZBxxKeVOk--avQ-XczwzA-1; Fri, 21 Aug 2020 16:13:59 -0400
X-MC-Unique: UZBxxKeVOk--avQ-XczwzA-1
Received: by mail-ej1-f68.google.com with SMTP id o23so3857478ejr.1
	for <linux-audit@redhat.com>; Fri, 21 Aug 2020 13:13:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=4BtYd9/pAyG1sqGYcTy0rM8tdo0b9K0n3vpfXHvN2DE=;
	b=ojuEQP/cxB6jSd11fUfNHkTqZUYZNoEweefq1Io096zJ0gQV9RnGzsHneSLqIF+kpu
	0vQXuHgcD/tQQCe18K2XhsaeWPB/4zWYnOai9IJXfB6nvpkOgYzpmZ+TGZiNp/5O8ed8
	5soKllVln3c3SNZpVUmVmTjFSAQr45pp/woNcY3tS995BBy8hVjJZtBKxpwRWMtXvOy9
	NoYXKHfdsi8XcH0p3fZ727ttm+dqRU6MwJ0H6QCvfGZZor36ZfYWDTtKbX/B+UW1C3Yw
	rDTPUNu0l6Rw6yVXVZt2egKKp46HaX6o1HEOe/Uug46svCIsPfE+DWj1gycuYBdwgMrl
	Gl4g==
X-Gm-Message-State: AOAM530heeNkOiJ42c+dxukoywYdVeurF/4Fe8dbcwmrnwfq62X4jLNH
	d1pvpjvct8ZpBYZScKzWVWvF5in5cMETzn29IhAyG8pHU45q
X-Google-Smtp-Source: ABdhPJyd88CfX7VJaFvZK1tKg0a4ztk8lkZlg+SopdBDlMcFpbfuejWoSXXNsA00gY0qnev4OvuNLAl+o4ySJ/3jueM=
X-Received: by 2002:a17:906:43c9:: with SMTP id
	j9mr4526810ejn.542.1598040837725; 
	Fri, 21 Aug 2020 13:13:57 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1593198710.git.rgb@redhat.com>
	<01229b93733d9baf6ac9bb0cc243eeb08ad579cd.1593198710.git.rgb@redhat.com>
	<CAHC9VhT6cLxxws_pYWcL=mWe786xPoTTFfPZ1=P4hx4V3nytXA@mail.gmail.com>
	<20200807171025.523i2sxfyfl7dfjy@madcap2.tricolour.ca>
In-Reply-To: <20200807171025.523i2sxfyfl7dfjy@madcap2.tricolour.ca>
From: Paul Moore <paul@paul-moore.com>
Date: Fri, 21 Aug 2020 16:13:45 -0400
Message-ID: <CAHC9VhQ3MVUY8Zs4GNXdaqhiPJBzHW_YcCe=DghAgo7g6yrNBw@mail.gmail.com>
Subject: Re: [PATCH ghak90 V9 11/13] audit: contid check descendancy and
	nesting
To: Richard Guy Briggs <rgb@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: linux-audit@redhat.com
Cc: nhorman@tuxdriver.com, linux-api@vger.kernel.org,
	containers@lists.linux-foundation.org, aris@redhat.com,
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
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Aug 7, 2020 at 1:10 PM Richard Guy Briggs <rgb@redhat.com> wrote:
> On 2020-07-05 11:11, Paul Moore wrote:
> > On Sat, Jun 27, 2020 at 9:23 AM Richard Guy Briggs <rgb@redhat.com> wrote:
> > > Require the target task to be a descendant of the container
> > > orchestrator/engine.

If you want to get formal about this, you need to define "target" in
the sentence above.  Target of what?

FWIW, I read the above to basically mean that a task can only set the
audit container ID of processes which are beneath it in the "process
tree" where the "process tree" is defined as the relationship between
a parent and children processes such that the children processes are
branches below the parent process.

I have no problem with that, with the understanding that nesting
complicates it somewhat.  For example, this isn't true when one of the
children is a nested orchestrator, is it?

> > > You would only change the audit container ID from one set or inherited
> > > value to another if you were nesting containers.

I thought we decided we were going to allow an orchestrator to move a
process between audit container IDs, yes?  no?

> > > If changing the contid, the container orchestrator/engine must be a
> > > descendant and not same orchestrator as the one that set it so it is not
> > > possible to change the contid of another orchestrator's container.

Try rephrasing the above please, it isn't clear to me what you are
trying to say.

> Are we able to agree on the premises above?  Is anything asserted that
> should not be and is there anything missing?

See above.

If you want to go back to the definitions/assumptions stage, it
probably isn't worth worrying about the other comments until we get
the above sorted.

-- 
paul moore
www.paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

