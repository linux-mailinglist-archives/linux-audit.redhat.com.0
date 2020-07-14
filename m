Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id B607621FF81
	for <lists+linux-audit@lfdr.de>; Tue, 14 Jul 2020 23:01:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1594760485;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=jx12d7jukwjqrxpY+apCZH6+5mL11vQOZwLEbi2keTA=;
	b=N0B0LOZYGzkH2O+sWonoMlJsQSlhFDozPuK66U3arJmcZG+fjDuxFXeL8dOMeisNOzZXyz
	7J55LAfFG3uLO2X52e1Y2uoDT6VEPXd4IkjKR+SOsFpRnSkIQVWYjDqaVhkpkxDEzFVLhA
	R3rkc7Th+xEv4z1wscsbkA6R3OeEI5w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-23-KoER8pjKNJ66uHs__MlCYw-1; Tue, 14 Jul 2020 17:00:53 -0400
X-MC-Unique: KoER8pjKNJ66uHs__MlCYw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5D877100960F;
	Tue, 14 Jul 2020 21:00:47 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 31F5E72E62;
	Tue, 14 Jul 2020 21:00:46 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 484831809554;
	Tue, 14 Jul 2020 21:00:44 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06EL0cT4010844 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 14 Jul 2020 17:00:38 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 4E59F7981F; Tue, 14 Jul 2020 21:00:38 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from madcap2.tricolour.ca (unknown [10.10.110.3])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 448597980F;
	Tue, 14 Jul 2020 21:00:30 +0000 (UTC)
Date: Tue, 14 Jul 2020 17:00:27 -0400
From: Richard Guy Briggs <rgb@redhat.com>
To: Paul Moore <paul@paul-moore.com>
Subject: Re: [PATCH ghak84 v4] audit: purge audit_log_string from the
	intra-kernel audit API
Message-ID: <20200714210027.me2ieywjfcsf4v5r@madcap2.tricolour.ca>
References: <6effbbd4574407d6af21162e57d9102d5f8b02ed.1594664015.git.rgb@redhat.com>
	<CAHC9VhSyq7yKQqwvHL5syU9+TFki6-__WfCrvqewbnU3xpND4Q@mail.gmail.com>
	<20200714174353.ds7lj3iisy67t2zu@madcap2.tricolour.ca>
	<CAHC9VhQusQsdQc7EfdjdH5mp6qqqYVPHnG9nNhUhf3DS_cdWwA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHC9VhQusQsdQc7EfdjdH5mp6qqqYVPHnG9nNhUhf3DS_cdWwA@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: linux-audit@redhat.com
Cc: Eric Paris <eparis@parisplace.org>,
	Linux Security Module list <linux-security-module@vger.kernel.org>,
	john.johansen@canonical.com, LKML <linux-kernel@vger.kernel.org>,
	Linux-Audit Mailing List <linux-audit@redhat.com>
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On 2020-07-14 16:29, Paul Moore wrote:
> On Tue, Jul 14, 2020 at 1:44 PM Richard Guy Briggs <rgb@redhat.com> wrote:
> > On 2020-07-14 12:21, Paul Moore wrote:
> > > On Mon, Jul 13, 2020 at 3:52 PM Richard Guy Briggs <rgb@redhat.com> wrote:
> > > >
> > > > audit_log_string() was inteded to be an internal audit function and
> > > > since there are only two internal uses, remove them.  Purge all external
> > > > uses of it by restructuring code to use an existing audit_log_format()
> > > > or using audit_log_format().
> > > >
> > > > Please see the upstream issue
> > > > https://github.com/linux-audit/audit-kernel/issues/84
> > > >
> > > > Signed-off-by: Richard Guy Briggs <rgb@redhat.com>
> > > > ---
> > > > Passes audit-testsuite.
> > > >
> > > > Changelog:
> > > > v4
> > > > - use double quotes in all replaced audit_log_string() calls
> > > >
> > > > v3
> > > > - fix two warning: non-void function does not return a value in all control paths
> > > >         Reported-by: kernel test robot <lkp@intel.com>
> > > >
> > > > v2
> > > > - restructure to piggyback on existing audit_log_format() calls, checking quoting needs for each.
> > > >
> > > > v1 Vlad Dronov
> > > > - https://github.com/nefigtut/audit-kernel/commit/dbbcba46335a002f44b05874153a85b9cc18aebf
> > > >
> > > >  include/linux/audit.h     |  5 -----
> > > >  kernel/audit.c            |  4 ++--
> > > >  security/apparmor/audit.c | 10 ++++------
> > > >  security/apparmor/file.c  | 25 +++++++------------------
> > > >  security/apparmor/ipc.c   | 46 +++++++++++++++++++++++-----------------------
> > > >  security/apparmor/net.c   | 14 ++++++++------
> > > >  security/lsm_audit.c      |  4 ++--
> > > >  7 files changed, 46 insertions(+), 62 deletions(-)
> > >
> > > Thanks for restoring the quotes, just one question below ...
> > >
> > > > diff --git a/security/apparmor/ipc.c b/security/apparmor/ipc.c
> > > > index 4ecedffbdd33..fe36d112aad9 100644
> > > > --- a/security/apparmor/ipc.c
> > > > +++ b/security/apparmor/ipc.c
> > > > @@ -20,25 +20,23 @@
> > > >
> > > >  /**
> > > >   * audit_ptrace_mask - convert mask to permission string
> > > > - * @buffer: buffer to write string to (NOT NULL)
> > > >   * @mask: permission mask to convert
> > > > + *
> > > > + * Returns: pointer to static string
> > > >   */
> > > > -static void audit_ptrace_mask(struct audit_buffer *ab, u32 mask)
> > > > +static const char *audit_ptrace_mask(u32 mask)
> > > >  {
> > > >         switch (mask) {
> > > >         case MAY_READ:
> > > > -               audit_log_string(ab, "read");
> > > > -               break;
> > > > +               return "read";
> > > >         case MAY_WRITE:
> > > > -               audit_log_string(ab, "trace");
> > > > -               break;
> > > > +               return "trace";
> > > >         case AA_MAY_BE_READ:
> > > > -               audit_log_string(ab, "readby");
> > > > -               break;
> > > > +               return "readby";
> > > >         case AA_MAY_BE_TRACED:
> > > > -               audit_log_string(ab, "tracedby");
> > > > -               break;
> > > > +               return "tracedby";
> > > >         }
> > > > +       return "";
> > >
> > > Are we okay with this returning an empty string ("") in this case?
> > > Should it be a question mark ("?")?
> > >
> > > My guess is that userspace parsing should be okay since it still has
> > > quotes, I'm just not sure if we wanted to use a question mark as we do
> > > in other cases where the field value is empty/unknown.
> >
> > Previously, it would have been an empty value, not even double quotes.
> > "?" might be an improvement.
> 
> Did you want to fix that now in this patch, or leave it to later?  As
> I said above, I'm not too bothered by it with the quotes so either way
> is fine by me.

I'd defer to Steve, otherwise I'd say leave it, since there wasn't
anything there before and this makes that more evident.

> John, I'm assuming you are okay with this patch?
> 
> -- 
> paul moore

- RGB

--
Richard Guy Briggs <rgb@redhat.com>
Sr. S/W Engineer, Kernel Security, Base Operating Systems
Remote, Ottawa, Red Hat Canada
IRC: rgb, SunRaycer
Voice: +1.647.777.2635, Internal: (81) 32635

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

