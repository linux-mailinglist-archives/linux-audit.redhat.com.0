Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 50A8F69AF7
	for <lists+linux-audit@lfdr.de>; Mon, 15 Jul 2019 20:42:41 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6522781DF1;
	Mon, 15 Jul 2019 18:42:38 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1547F5C224;
	Mon, 15 Jul 2019 18:42:36 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3679A1833002;
	Mon, 15 Jul 2019 18:42:31 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x6FIgKpJ026530 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 15 Jul 2019 14:42:20 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 4E4795DA34; Mon, 15 Jul 2019 18:42:20 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from madcap2.tricolour.ca (ovpn-112-14.phx2.redhat.com [10.3.112.14])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7CFCA4F676;
	Mon, 15 Jul 2019 18:42:12 +0000 (UTC)
Date: Mon, 15 Jul 2019 14:42:09 -0400
From: Richard Guy Briggs <rgb@redhat.com>
To: Stephen Smalley <sds@tycho.nsa.gov>
Subject: Re: [RFC PATCH] security, capability: pass object information to
	security_capable
Message-ID: <20190715184209.j75kpav4tmmunejh@madcap2.tricolour.ca>
References: <20190712173404.14417-1-nhfran2@tycho.nsa.gov>
	<alpine.LRH.2.21.1907130347010.1509@namei.org>
	<3605eb1a-fb1c-8933-b1e1-a60e54fb1e1c@tycho.nsa.gov>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3605eb1a-fb1c-8933-b1e1-a60e54fb1e1c@tycho.nsa.gov>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: linux-audit@redhat.com
Cc: mortonm@chromium.org, john.johansen@canonical.com, selinux@vger.kernel.org,
	James Morris <jmorris@namei.org>, luto@amacapital.net,
	linux-security-module@vger.kernel.org,
	"linux-audit@redhat.com" <linux-audit@redhat.com>,
	serge@hallyn.com, Nicholas Franck <nhfran2@tycho.nsa.gov>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.25]); Mon, 15 Jul 2019 18:42:40 +0000 (UTC)

On 2019-07-12 14:02, Stephen Smalley wrote:
> On 7/12/19 1:50 PM, James Morris wrote:
> > On Fri, 12 Jul 2019, Nicholas Franck wrote:
> > 

This aggressive trimming dropped a bit of helpful context:

+++ b/security/lsm_audit.c
@@ -229,9 +229,26 @@ static void dump_common_audit_data(struct
audit_buffer *ab,
        case LSM_AUDIT_DATA_IPC:
                audit_log_format(ab, " key=%d ", a->u.ipc_id);
                break;
-       case LSM_AUDIT_DATA_CAP:
-               audit_log_format(ab, " capability=%d ", a->u.cap);

> > > +	case LSM_AUDIT_DATA_CAP: {
> > > +		const struct inode *inode;
> > > +
> > > +		if (a->u.cap_struct.cad) {
> > > +			switch (a->u.cap_struct.cad->type) {
> > > +			case CAP_AUX_DATA_INODE: {
> > > +				inode = a->u.cap_struct.cad->u.inode;
> > > +
> > > +				audit_log_format(ab, " dev=");
> > > +				audit_log_untrustedstring(ab,
> > > +					inode->i_sb->s_id);
> > > +				audit_log_format(ab, " ino=%lu",
> > > +					inode->i_ino);
> > > +				break;
> > > +			}
> > > +			}
> > > +		}
> > > +		audit_log_format(ab, " capability=%d ", a->u.cap_struct.cap);
> > >   		break;

+       }
        case LSM_AUDIT_DATA_PATH: {
                struct inode *inode;

> > 
> > Will this break any existing userspace log parsers?
> 
> I'm hoping not given that we are only adding auxiliary fields and those are
> already defined for other AVC audit messages.  ausearch appeared to work
> fine.  Added the linux-audit mailing list to the cc line to get their view.

Generally, additional or optional fields should only be added after
existing ones.  Also, generally, fields should not be optional, but this
is tricky since it gobbles network and cpu bandwidth and disk space and
there are lots of precedents to contradict this.


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
