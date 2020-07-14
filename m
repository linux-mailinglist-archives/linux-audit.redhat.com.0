Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 6F26F21F866
	for <lists+linux-audit@lfdr.de>; Tue, 14 Jul 2020 19:44:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1594748668;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=hOn0pxG7It+dlY36JddrPbX1EkifK6L6qp+ypor8hxQ=;
	b=HlnNGDodP+9AA/Vh68U0CUAS0YaIOtVoMTiQMQYkWbzROPVYngW2lEKpEgyFI2EVkxfFuK
	MeSkgb7kYOEhcKTUaLq4B2GZC6+mNzH7pDa1o9exJjSykAGAe0o5Lyj3SdF+aYyK1mfqXs
	cWdh5PJ50LY+7kWXLT4qGrNb/ZcVybg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-228-0_lppHK_OqukVMYeGtg-Ag-1; Tue, 14 Jul 2020 13:44:25 -0400
X-MC-Unique: 0_lppHK_OqukVMYeGtg-Ag-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D8F05107ACCA;
	Tue, 14 Jul 2020 17:44:18 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8566460BF4;
	Tue, 14 Jul 2020 17:44:16 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9950494EFA;
	Tue, 14 Jul 2020 17:44:12 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06EHi4iA022333 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 14 Jul 2020 13:44:04 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 731A6724D4; Tue, 14 Jul 2020 17:44:04 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from madcap2.tricolour.ca (unknown [10.10.110.3])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B9E786FEDF;
	Tue, 14 Jul 2020 17:43:56 +0000 (UTC)
Date: Tue, 14 Jul 2020 13:43:53 -0400
From: Richard Guy Briggs <rgb@redhat.com>
To: Paul Moore <paul@paul-moore.com>
Subject: Re: [PATCH ghak84 v4] audit: purge audit_log_string from the
	intra-kernel audit API
Message-ID: <20200714174353.ds7lj3iisy67t2zu@madcap2.tricolour.ca>
References: <6effbbd4574407d6af21162e57d9102d5f8b02ed.1594664015.git.rgb@redhat.com>
	<CAHC9VhSyq7yKQqwvHL5syU9+TFki6-__WfCrvqewbnU3xpND4Q@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHC9VhSyq7yKQqwvHL5syU9+TFki6-__WfCrvqewbnU3xpND4Q@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: linux-audit@redhat.com
Cc: Eric Paris <eparis@parisplace.org>,
	Linux Security Module list <linux-security-module@vger.kernel.org>,
	Linux-Audit Mailing List <linux-audit@redhat.com>,
	LKML <linux-kernel@vger.kernel.org>, john.johansen@canonical.com
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On 2020-07-14 12:21, Paul Moore wrote:
> On Mon, Jul 13, 2020 at 3:52 PM Richard Guy Briggs <rgb@redhat.com> wrote:
> >
> > audit_log_string() was inteded to be an internal audit function and
> > since there are only two internal uses, remove them.  Purge all external
> > uses of it by restructuring code to use an existing audit_log_format()
> > or using audit_log_format().
> >
> > Please see the upstream issue
> > https://github.com/linux-audit/audit-kernel/issues/84
> >
> > Signed-off-by: Richard Guy Briggs <rgb@redhat.com>
> > ---
> > Passes audit-testsuite.
> >
> > Changelog:
> > v4
> > - use double quotes in all replaced audit_log_string() calls
> >
> > v3
> > - fix two warning: non-void function does not return a value in all control paths
> >         Reported-by: kernel test robot <lkp@intel.com>
> >
> > v2
> > - restructure to piggyback on existing audit_log_format() calls, checking quoting needs for each.
> >
> > v1 Vlad Dronov
> > - https://github.com/nefigtut/audit-kernel/commit/dbbcba46335a002f44b05874153a85b9cc18aebf
> >
> >  include/linux/audit.h     |  5 -----
> >  kernel/audit.c            |  4 ++--
> >  security/apparmor/audit.c | 10 ++++------
> >  security/apparmor/file.c  | 25 +++++++------------------
> >  security/apparmor/ipc.c   | 46 +++++++++++++++++++++++-----------------------
> >  security/apparmor/net.c   | 14 ++++++++------
> >  security/lsm_audit.c      |  4 ++--
> >  7 files changed, 46 insertions(+), 62 deletions(-)
> 
> Thanks for restoring the quotes, just one question below ...
> 
> > diff --git a/security/apparmor/ipc.c b/security/apparmor/ipc.c
> > index 4ecedffbdd33..fe36d112aad9 100644
> > --- a/security/apparmor/ipc.c
> > +++ b/security/apparmor/ipc.c
> > @@ -20,25 +20,23 @@
> >
> >  /**
> >   * audit_ptrace_mask - convert mask to permission string
> > - * @buffer: buffer to write string to (NOT NULL)
> >   * @mask: permission mask to convert
> > + *
> > + * Returns: pointer to static string
> >   */
> > -static void audit_ptrace_mask(struct audit_buffer *ab, u32 mask)
> > +static const char *audit_ptrace_mask(u32 mask)
> >  {
> >         switch (mask) {
> >         case MAY_READ:
> > -               audit_log_string(ab, "read");
> > -               break;
> > +               return "read";
> >         case MAY_WRITE:
> > -               audit_log_string(ab, "trace");
> > -               break;
> > +               return "trace";
> >         case AA_MAY_BE_READ:
> > -               audit_log_string(ab, "readby");
> > -               break;
> > +               return "readby";
> >         case AA_MAY_BE_TRACED:
> > -               audit_log_string(ab, "tracedby");
> > -               break;
> > +               return "tracedby";
> >         }
> > +       return "";
> 
> Are we okay with this returning an empty string ("") in this case?
> Should it be a question mark ("?")?
> 
> My guess is that userspace parsing should be okay since it still has
> quotes, I'm just not sure if we wanted to use a question mark as we do
> in other cases where the field value is empty/unknown.

Previously, it would have been an empty value, not even double quotes.
"?" might be an improvement.

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

