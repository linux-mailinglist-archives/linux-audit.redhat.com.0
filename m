Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 2827226926
	for <lists+linux-audit@lfdr.de>; Wed, 22 May 2019 19:36:46 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 511E63082A24;
	Wed, 22 May 2019 17:36:18 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4409A600C0;
	Wed, 22 May 2019 17:36:00 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id CABB25B423;
	Wed, 22 May 2019 17:35:43 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x4MHYlT0015922 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 22 May 2019 13:34:47 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 7D651608C6; Wed, 22 May 2019 17:34:47 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from x2.localnet (ovpn-123-57.rdu2.redhat.com [10.10.123.57])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C66CB4E6CC;
	Wed, 22 May 2019 17:34:41 +0000 (UTC)
From: Steve Grubb <sgrubb@redhat.com>
To: Lenny Bruzenak <lenny@magitekltd.com>
Subject: Re: useradd question
Date: Wed, 22 May 2019 13:34:34 -0400
Message-ID: <1895815.SLc6sCx9v7@x2>
Organization: Red Hat
In-Reply-To: <75873a5b-255c-9b31-1b0e-6a1552021ab1@magitekltd.com>
References: <d3d7fc57-c368-9d01-aae5-cb5469cd2334@magitekltd.com>
	<2786293.P8e7BSF5A5@x2>
	<75873a5b-255c-9b31-1b0e-6a1552021ab1@magitekltd.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: linux-audit-bounces@redhat.com
Errors-To: linux-audit-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.45]); Wed, 22 May 2019 17:36:44 +0000 (UTC)

On Monday, May 20, 2019 4:05:55 PM EDT Lenny Bruzenak wrote:
> On 5/20/19 2:59 PM, Steve Grubb wrote:
> > So...I went digging through the source code of useradd.c. In main is this
> > 
> > comment:
> >         /*
> >         
> >          * Do the hard stuff:
> >          * - open the files,
> >          * - create the user entries,
> >          * - create the home directory,
> >          * - create user mail spool,
> >          * - flush nscd caches for passwd and group services,
> >          * - then close and update the files.
> >          */
> > 
> > If you dig around, you'll see in the above process it calls usr_update().
> > This is where the audit event is. The very next function call is
> > close_files. This is where it actually writes to the files where it
> > would be visible to auditd. So, it looks like auditing in shadow-utils
> > is busted.
> > 
> > I also see where its calling pam_tally2 which is deprecated for years. It
> > should be calling faillock. I'll chat with upstream maintainers.
> 
> Thank you Steve, much appreciated! If they are able to provide a patch,
> would you mind asking them to send me a link and I'll test it ASAP?

I think this is the right fix:

diff -urp shadow-4.6.orig/src/useradd.c shadow-4.6/src/useradd.c
--- shadow-4.6.orig/src/useradd.c       2019-05-21 08:26:12.533328554 -0400
+++ shadow-4.6/src/useradd.c    2019-05-22 12:21:46.305293997 -0400
@@ -1955,9 +1955,14 @@ static void usr_update (void)
 #endif                         /* ENABLE_SUBIDS */

 #ifdef WITH_AUDIT
+       /*
+        * Even though we have the ID of the user, we won't send it now
+        * because its not written to disk yet. After close_files it is
+        * and we can use the real ID thereafter.
+        */
        audit_logger (AUDIT_ADD_USER, Prog,
                      "add-user",
-                     user_name, (unsigned int) user_id,
+                     user_name, AUDIT_NO_ID,
                      SHADOW_AUDIT_SUCCESS);
 #endif
        /*



--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
