Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 7543A21FE9A
	for <lists+linux-audit@lfdr.de>; Tue, 14 Jul 2020 22:31:52 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-303-PyXMq5ASODKsNifqK_DCVg-1; Tue, 14 Jul 2020 16:30:46 -0400
X-MC-Unique: PyXMq5ASODKsNifqK_DCVg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A1F9B1DEA;
	Tue, 14 Jul 2020 20:30:40 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0F19672E60;
	Tue, 14 Jul 2020 20:30:37 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B463794EFE;
	Tue, 14 Jul 2020 20:30:29 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06EKUJK3007532 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 14 Jul 2020 16:30:19 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 4F3282156709; Tue, 14 Jul 2020 20:30:19 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4B0C9215688E
	for <linux-audit@redhat.com>; Tue, 14 Jul 2020 20:30:17 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 39FBD800394
	for <linux-audit@redhat.com>; Tue, 14 Jul 2020 20:30:17 +0000 (UTC)
Received: from mail-ej1-f68.google.com (mail-ej1-f68.google.com
	[209.85.218.68]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-396-bx6RhXsKMKeDVjw2xfP0aQ-1; Tue, 14 Jul 2020 16:29:56 -0400
X-MC-Unique: bx6RhXsKMKeDVjw2xfP0aQ-1
Received: by mail-ej1-f68.google.com with SMTP id n26so24382783ejx.0
	for <linux-audit@redhat.com>; Tue, 14 Jul 2020 13:29:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=hjKqA7umLRIxRuItN1sl62t5J7bejaeQmEpJ3yltvGM=;
	b=iv7ekp6+8l8+qxYC2vmQZ+V2puQdvi9qYwBDugL8O22YbVZPb8mJDmtMkeX4EBFsUa
	Pt5dhg2P/VAjiECEBETKy2Ibq/9HVfOh5tbM9A0YTuVyJz4pPd8pFpm9T+G6Ejk57Urr
	f+Fc9KAA0wiVtHK8bsXh5f5YGo1CaQyBCHOUQuMWfVT7rAohqIvZ+0XNsw5o8nUo2omT
	6+PuAuRyfDCs9vQOWu/07atwCJ8GIJMhYReRwjSiUcqYkYr2bzQfLQTQYb3okmDNi2V/
	7Pm2S2GPy9VySbwabrs0qdZJRVevMUOag3vZwIRtoKNlERVwu5iCHfKxBK+02ynORPUm
	GXuw==
X-Gm-Message-State: AOAM532NwRfuwc81cP3m5FYStuX2MppQDZg1XE8SuEIZc7oAKtBiAEpG
	1CTTfXUML83cTjE9NaLt3yz5GSFe0Ju/BOgyWT+B
X-Google-Smtp-Source: ABdhPJxvq7nppS25v1q/HDU5+iaADhxEqtCisqHD/Sqd9FpL1k9JSG25kraTuC2F3qavCtm5M30uvWwWkhoUSOMQTYI=
X-Received: by 2002:a17:906:456:: with SMTP id
	e22mr6132963eja.178.1594758582843; 
	Tue, 14 Jul 2020 13:29:42 -0700 (PDT)
MIME-Version: 1.0
References: <6effbbd4574407d6af21162e57d9102d5f8b02ed.1594664015.git.rgb@redhat.com>
	<CAHC9VhSyq7yKQqwvHL5syU9+TFki6-__WfCrvqewbnU3xpND4Q@mail.gmail.com>
	<20200714174353.ds7lj3iisy67t2zu@madcap2.tricolour.ca>
In-Reply-To: <20200714174353.ds7lj3iisy67t2zu@madcap2.tricolour.ca>
From: Paul Moore <paul@paul-moore.com>
Date: Tue, 14 Jul 2020 16:29:30 -0400
Message-ID: <CAHC9VhQusQsdQc7EfdjdH5mp6qqqYVPHnG9nNhUhf3DS_cdWwA@mail.gmail.com>
Subject: Re: [PATCH ghak84 v4] audit: purge audit_log_string from the
	intra-kernel audit API
To: Richard Guy Briggs <rgb@redhat.com>, john.johansen@canonical.com
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: linux-audit@redhat.com
Cc: Eric Paris <eparis@parisplace.org>,
	Linux Security Module list <linux-security-module@vger.kernel.org>,
	Linux-Audit Mailing List <linux-audit@redhat.com>,
	LKML <linux-kernel@vger.kernel.org>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Jul 14, 2020 at 1:44 PM Richard Guy Briggs <rgb@redhat.com> wrote:
> On 2020-07-14 12:21, Paul Moore wrote:
> > On Mon, Jul 13, 2020 at 3:52 PM Richard Guy Briggs <rgb@redhat.com> wrote:
> > >
> > > audit_log_string() was inteded to be an internal audit function and
> > > since there are only two internal uses, remove them.  Purge all external
> > > uses of it by restructuring code to use an existing audit_log_format()
> > > or using audit_log_format().
> > >
> > > Please see the upstream issue
> > > https://github.com/linux-audit/audit-kernel/issues/84
> > >
> > > Signed-off-by: Richard Guy Briggs <rgb@redhat.com>
> > > ---
> > > Passes audit-testsuite.
> > >
> > > Changelog:
> > > v4
> > > - use double quotes in all replaced audit_log_string() calls
> > >
> > > v3
> > > - fix two warning: non-void function does not return a value in all control paths
> > >         Reported-by: kernel test robot <lkp@intel.com>
> > >
> > > v2
> > > - restructure to piggyback on existing audit_log_format() calls, checking quoting needs for each.
> > >
> > > v1 Vlad Dronov
> > > - https://github.com/nefigtut/audit-kernel/commit/dbbcba46335a002f44b05874153a85b9cc18aebf
> > >
> > >  include/linux/audit.h     |  5 -----
> > >  kernel/audit.c            |  4 ++--
> > >  security/apparmor/audit.c | 10 ++++------
> > >  security/apparmor/file.c  | 25 +++++++------------------
> > >  security/apparmor/ipc.c   | 46 +++++++++++++++++++++++-----------------------
> > >  security/apparmor/net.c   | 14 ++++++++------
> > >  security/lsm_audit.c      |  4 ++--
> > >  7 files changed, 46 insertions(+), 62 deletions(-)
> >
> > Thanks for restoring the quotes, just one question below ...
> >
> > > diff --git a/security/apparmor/ipc.c b/security/apparmor/ipc.c
> > > index 4ecedffbdd33..fe36d112aad9 100644
> > > --- a/security/apparmor/ipc.c
> > > +++ b/security/apparmor/ipc.c
> > > @@ -20,25 +20,23 @@
> > >
> > >  /**
> > >   * audit_ptrace_mask - convert mask to permission string
> > > - * @buffer: buffer to write string to (NOT NULL)
> > >   * @mask: permission mask to convert
> > > + *
> > > + * Returns: pointer to static string
> > >   */
> > > -static void audit_ptrace_mask(struct audit_buffer *ab, u32 mask)
> > > +static const char *audit_ptrace_mask(u32 mask)
> > >  {
> > >         switch (mask) {
> > >         case MAY_READ:
> > > -               audit_log_string(ab, "read");
> > > -               break;
> > > +               return "read";
> > >         case MAY_WRITE:
> > > -               audit_log_string(ab, "trace");
> > > -               break;
> > > +               return "trace";
> > >         case AA_MAY_BE_READ:
> > > -               audit_log_string(ab, "readby");
> > > -               break;
> > > +               return "readby";
> > >         case AA_MAY_BE_TRACED:
> > > -               audit_log_string(ab, "tracedby");
> > > -               break;
> > > +               return "tracedby";
> > >         }
> > > +       return "";
> >
> > Are we okay with this returning an empty string ("") in this case?
> > Should it be a question mark ("?")?
> >
> > My guess is that userspace parsing should be okay since it still has
> > quotes, I'm just not sure if we wanted to use a question mark as we do
> > in other cases where the field value is empty/unknown.
>
> Previously, it would have been an empty value, not even double quotes.
> "?" might be an improvement.

Did you want to fix that now in this patch, or leave it to later?  As
I said above, I'm not too bothered by it with the quotes so either way
is fine by me.

John, I'm assuming you are okay with this patch?

-- 
paul moore
www.paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

