Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 0FF69153B8E
	for <lists+linux-audit@lfdr.de>; Wed,  5 Feb 2020 23:59:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1580943552;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=P8msNJZgcTj/KVvWpogLvjUg+mQ0FV1Z5RDofyKoNOs=;
	b=Jvf7caZ4EAxyMMiqCg4jrqu6tz1BZsUAUjPknmDUneM/IsRgB30OkXq/TAeGRdFZEE8SL+
	bIQuJniNKIs5vyQgqsLdHI4DhZa/MdTqCzQKmjgVsvbW+0kEPaTYIsyQg/0iQ3tGKj+ljV
	sSl0Mp6/YSlaFXuzgiBbC1A3VEKSLbs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-220-dpxrnBZtNmOklBc9x8tgsA-1; Wed, 05 Feb 2020 17:59:10 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CB01B18FE870;
	Wed,  5 Feb 2020 22:59:05 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A6742165F0;
	Wed,  5 Feb 2020 22:59:05 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4CA7F8175D;
	Wed,  5 Feb 2020 22:59:05 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 015MwJOb028626 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 5 Feb 2020 17:58:19 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 20E172166B28; Wed,  5 Feb 2020 22:58:19 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1C0232166B27
	for <linux-audit@redhat.com>; Wed,  5 Feb 2020 22:58:16 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A3A79802098
	for <linux-audit@redhat.com>; Wed,  5 Feb 2020 22:58:16 +0000 (UTC)
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com
	[209.85.208.68]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-106-fgb2hxzdMO6jTkiAbiOa9g-1; Wed, 05 Feb 2020 17:58:07 -0500
Received: by mail-ed1-f68.google.com with SMTP id c26so3855343eds.8
	for <linux-audit@redhat.com>; Wed, 05 Feb 2020 14:58:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=oUqqVzVv+zHVRjksql7Cab1+TMNFjyRWbvebZrdripg=;
	b=ZbCLFv+88R3qVPqFNbhtEbTZYqhixvTjvuNn08fdUXl2GOszWyV9r9u3vfPMuOLh0b
	SbHkVkOVZmWjasEJemZvU6XJM9g10pVuNqAexMIWNI3Y8ViEXVcbvXuVEiC1EopnlkPC
	6Nw/x4ySjYGazL5IwT3g5HV5G3ZmCFAqPsCU0VyZQvv7UbpvuBTmcmmTEGicxllC9Ed0
	lvIYl+FHSVnI0r4x1IAHURoVDy2bVnpdS9XdXBnH9+vm60NizdbYsPdhzkeWwtITEjNj
	gRDYQdYiC4+cFNVshXnZc3/XjabYiFs+JmG23ca3TABXJhdBIaer0pyIe8ajqgDLIi5x
	DxjQ==
X-Gm-Message-State: APjAAAVQOAV5/mynrtN43Be5IK2FZQon/k84FiHOrMfdGog+w9QyI5s/
	CzIPF9q6r47hgtPxPetln8YtkZR9pLt3bOJvInr7
X-Google-Smtp-Source: APXvYqyqotke6mOUBVhpWeNPdxHTvQmAmbBNNpCHK3jA+gycAlKDCEspfqtGiRIi6zOl8VqQ5CArsS+4qJCbOLGo7NA=
X-Received: by 2002:a17:906:9352:: with SMTP id
	p18mr292520ejw.95.1580943486402; 
	Wed, 05 Feb 2020 14:58:06 -0800 (PST)
MIME-Version: 1.0
References: <cover.1577736799.git.rgb@redhat.com> <3665686.i1MIc9PeWa@x2>
	<CAHC9VhRHfjuv5yyn+nQ2LbHtcezBcjKtOQ69ssYrXOiExuCjBw@mail.gmail.com>
	<35934535.C1y6eIYgqz@x2>
In-Reply-To: <35934535.C1y6eIYgqz@x2>
From: Paul Moore <paul@paul-moore.com>
Date: Wed, 5 Feb 2020 17:57:55 -0500
Message-ID: <CAHC9VhQnNUM8XQpFykx_Rg0zNLCaCWDo=HSY3RPhN3ft-RpyHw@mail.gmail.com>
Subject: Re: [PATCH ghak90 V8 13/16] audit: track container nesting
To: Steve Grubb <sgrubb@redhat.com>
X-MC-Unique: fgb2hxzdMO6jTkiAbiOa9g-1
X-MC-Unique: dpxrnBZtNmOklBc9x8tgsA-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 015MwJOb028626
X-loop: linux-audit@redhat.com
Cc: nhorman@tuxdriver.com, Richard Guy Briggs <rgb@redhat.com>,
	linux-api@vger.kernel.org, containers@lists.linux-foundation.org,
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Feb 4, 2020 at 1:12 PM Steve Grubb <sgrubb@redhat.com> wrote:
> On Tuesday, February 4, 2020 10:52:36 AM EST Paul Moore wrote:
> > On Tue, Feb 4, 2020 at 10:47 AM Steve Grubb <sgrubb@redhat.com> wrote:
> > > On Tuesday, February 4, 2020 8:19:44 AM EST Richard Guy Briggs wrote:
> > > > > The established pattern is that we print -1 when its unset and "?"
> > > > > when
> > > > > its totalling missing. So, how could this be invalid? It should be
> > > > > set
> > > > > or not. That is unless its totally missing just like when we do not
> > > > > run
> > > > > with selinux enabled and a context just doesn't exist.
> > > >
> > > > Ok, so in this case it is clearly unset, so should be -1, which will be
> > > > a
> > > > 20-digit number when represented as an unsigned long long int.
> > > >
> > > > Thank you for that clarification Steve.
> > >
> > > It is literally a  -1.  ( 2 characters)
> >
> > Well, not as Richard has currently written the code, it is a "%llu".
> > This was why I asked the question I did; if we want the "-1" here we
> > probably want to special case that as I don't think we want to display
> > audit container IDs as signed numbers in general.
>
> OK, then go with the long number, we'll fix it in the interpretation. I guess
> we do the same thing for auid.

As I said above, I'm okay with a special case handling for unset/"-1"
in this case.

-- 
paul moore
www.paul-moore.com


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

