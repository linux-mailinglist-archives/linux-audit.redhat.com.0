Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 2A4E8163642
	for <lists+linux-audit@lfdr.de>; Tue, 18 Feb 2020 23:36:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1582065377;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=qlLKBHv2YjP25PSwBkL3TX00PuxrhTss4/qCbj16dJc=;
	b=jAE8BFj2EBtWcGZ5jihIjevzM4y9151G7Etq6UrUWbkQqRFD2m7Xwzwes6x0t0MDTq26Xb
	nql+R3XGQe78bKVuG16V++2yQIKweH9QYcD/G3lfJ9d62V7YjYuRGToTY2HtomoXAv0pY2
	CvnVBl4gOIArUC7qC8+4g3j7UqOsE8g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-25-NBqjG-S_P82ExPrwYcNShA-1; Tue, 18 Feb 2020 17:36:14 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 00F0FDB61;
	Tue, 18 Feb 2020 22:36:07 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EDE5E1001B00;
	Tue, 18 Feb 2020 22:36:05 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C62611809567;
	Tue, 18 Feb 2020 22:36:00 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01IMZpVM023717 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 18 Feb 2020 17:35:51 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id CB9B088859; Tue, 18 Feb 2020 22:35:51 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from madcap2.tricolour.ca (ovpn-112-16.rdu2.redhat.com
	[10.10.112.16])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6C0D785735;
	Tue, 18 Feb 2020 22:35:43 +0000 (UTC)
Date: Tue, 18 Feb 2020 17:35:40 -0500
From: Richard Guy Briggs <rgb@redhat.com>
To: Paul Moore <paul@paul-moore.com>
Subject: Re: [PATCH ghak25 v2 7/9] netfilter: ebtables audit table registration
Message-ID: <20200218223540.2apm7spat3z3yyif@madcap2.tricolour.ca>
References: <cover.1577830902.git.rgb@redhat.com>
	<9f16dee52bac9a3068939283a0122a632ee0438d.1577830902.git.rgb@redhat.com>
	<CAHC9VhS4Cz1T=hycPVz3aCzOpPX-EDzwh284YQ2V5rUM7BJkzg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHC9VhS4Cz1T=hycPVz3aCzOpPX-EDzwh284YQ2V5rUM7BJkzg@mail.gmail.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: linux-audit@redhat.com
Cc: fw@strlen.de, LKML <linux-kernel@vger.kernel.org>,
	Linux-Audit Mailing List <linux-audit@redhat.com>,
	netfilter-devel@vger.kernel.org, ebiederm@xmission.com,
	twoerner@redhat.com, Eric Paris <eparis@parisplace.org>,
	tgraf@infradead.org
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: NBqjG-S_P82ExPrwYcNShA-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On 2020-01-30 22:18, Paul Moore wrote:
> On Mon, Jan 6, 2020 at 1:56 PM Richard Guy Briggs <rgb@redhat.com> wrote:
> >
> > Generate audit NETFILTER_CFG records on ebtables table registration.
> >
> > Previously this was only being done for all x_tables operations and
> > ebtables table replacement.
> >
> > Call new audit_nf_cfg() to store table parameters for later use with
> > syscall records.
> >
> > Here is a sample accompanied record:
> >   type=NETFILTER_CFG msg=audit(1494907217.558:5403): table=filter family=7 entries=0
> 
> Wait a minute ... in patch 4 you have code that explicitly checks for
> "entries=0" and doesn't generate a record in that case; is the example
> a lie or is the code a lie? ;)

The example was stale once the entries check was added.  The entries
check has now been removed due to the source of registration records
being orphanned from their syscall record being found and solved in the
ghak120 (norule missing accompanying) issue.

However, there are ebtables nat and filter tables being added that are
being automatically reaped if there are no entries and there is no
syscall accompanying them.  I don't yet know if it is being reaped by
userspace with an async drop, or if it is the kernel that is deciding to
garbage collect that table after a period of disuse.

Some quick instrumentation says it is kernel thread [kworker/u4:2-events_unbound]

pid=153 uid=0 auid=4294967295 tty=(none) ses=4294967295 subj=system_u:system_r:kernel_t:s0 comm="kworker/u4:2" exe=(null)

> > See: https://github.com/linux-audit/audit-kernel/issues/43
> > Signed-off-by: Richard Guy Briggs <rgb@redhat.com>
> > ---
> >  net/bridge/netfilter/ebtables.c | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/net/bridge/netfilter/ebtables.c b/net/bridge/netfilter/ebtables.c
> > index 57dc11c0f349..58126547b175 100644
> > --- a/net/bridge/netfilter/ebtables.c
> > +++ b/net/bridge/netfilter/ebtables.c
> > @@ -1219,6 +1219,8 @@ int ebt_register_table(struct net *net, const struct ebt_table *input_table,
> >                 *res = NULL;
> >         }
> >
> > +       if (audit_enabled)
> > +               audit_nf_cfg(repl->name, AF_BRIDGE, repl->nentries);
> >         return ret;
> >  free_unlock:
> >         mutex_unlock(&ebt_mutex);
> > --
> > 1.8.3.1
> 
> --
> paul moore
> www.paul-moore.com
> 

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

