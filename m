Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 5A32D25E471
	for <lists+linux-audit@lfdr.de>; Sat,  5 Sep 2020 01:59:28 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-35-Zu3A_m3lM4uOihwB0asf4g-1; Fri, 04 Sep 2020 19:59:25 -0400
X-MC-Unique: Zu3A_m3lM4uOihwB0asf4g-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B848B801ABB;
	Fri,  4 Sep 2020 23:59:19 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E6CA57ED6A;
	Fri,  4 Sep 2020 23:59:17 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E8EFA7A30E;
	Fri,  4 Sep 2020 23:59:10 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 084NwwmI009872 for <linux-audit@listman.util.phx.redhat.com>;
	Fri, 4 Sep 2020 19:58:58 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 41113202451D; Fri,  4 Sep 2020 23:58:58 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3C1A5200AE6E
	for <linux-audit@redhat.com>; Fri,  4 Sep 2020 23:58:55 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 130D8101A568
	for <linux-audit@redhat.com>; Fri,  4 Sep 2020 23:58:55 +0000 (UTC)
Received: from sonic316-27.consmr.mail.ne1.yahoo.com
	(sonic316-27.consmr.mail.ne1.yahoo.com [66.163.187.153]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-390-k44L4sOFMx6i_PXNdNPgmw-1;
	Fri, 04 Sep 2020 19:58:51 -0400
X-MC-Unique: k44L4sOFMx6i_PXNdNPgmw-1
X-YMail-OSG: NYqv0qYVM1kg4ANV6.jw0jnzHfac9YNHujC4RqUWyqEWfcY6B5dA3Y.JZxa_8P8
	hV1In0w3O0q.9wKSICpzmnLntEE73QvZfu_T.6agKAvPtuM63mmAVzc3n2ZvxTdfiOXgVXIvMK.B
	v54opuWIrSn9WrQL7.aG1Gq8Didd.hwBPt8iJHBLg_hqMg0HXsf9g.uIhoPM8seBNtLgZYQanoi5
	wzZyhnAj7iCSc_zpa8IWWQSupT0h2zhKnZxPvpJ9H6K9KNAhCGQFA_bnthDFe75krA1f.4eKys.N
	Z51ZN5X.qEZC11XbHzfMHiSczJFH6txprxAdZd6sHYCoSboOZ5ErUHwFcOEJ.pISHJ2QlVRA1a1Y
	HOfq8yVpE8vt2xAcZZ27biY4vXsemAqMady99Y4G.5t54GqziD9ovgbjwMWSadhfVurXpbzn4gxW
	QPT480qVctMhfqhqLvBhikrMgtVmXqo0mA.VDVVfwBZ67HyVef92ihT23NS_UkLx383LA.lK86pp
	uR.h0m4xJleaO3RrrzLHrnUbeEEW8zOwur9JqTqYzxqVKa5PgwAZ83zfLz.oENdSdKyLGH1th5.A
	g_j9WqaH5zR18wwor52LqdX.x_yg.munDULFWPCer2sDHxW_lxNV7iN0NyklvchgWHzTjBohfWJm
	dJahAO9diwxp_vcxUvdA9JtXNK3hfHr3MuwDRLnyru_w3fr4MThVQpv7AYT5jzcvJL_yCxmyvpkc
	DAZiN5hdstz2UbwmuJxs252D.C3Ti.S0BrgLcUteIWD30ok4I3S6xGsyqtQJOWA7VjCL2iBD8Dgl
	WoxCuNVYBY9N5irqfQ4zeOCOZY8wAjeoq0SzezmzA4bOlo1vT4DFyFP4iSo3_gehDKaSyKl4h8e4
	8MbeFrUq6WGk.FWPrD5b9PBsGn9.n6BuNlMszJ0NFVgjbnwwuDQu.DGjWLfiVzKe8I3M7zwQ8DTO
	6SUHCpuWg5FAXznpQMLD8sf_90EtjovXuWTGZfFktEMR03cxiuqLFSgrto54pz0e6p0mQRyzckNh
	dQ1jAnHt3grdn.GJhoaNBC3Kj2kLaJuVLiA8wM8D2Mm4v5h0iZVGchK_Cu4G75IZJLkEAN6mH3Ns
	QK5UIQkmqwoZGK09WIGQ36nIUg81HZ9q3A4cs9R5Arau4FgTlUaQg8lMxAOtqVDd1OqqmMI53JLX
	KuAcB_l2ate7uyAhTK67eS4EUW2HCYyHrm2zuttu7Z4Fm5v.QQFHiJG3iupYlvIsCIDalLZkF5.E
	6J.hjQYZaY.GeIGM4g82x3T9PzPe.S3BvoIg6aU0Qf.QTa.VBNSeroLiwAEyhVc8EXWtv9KfEOGG
	x2fFD0M3govOzM9cwya2kBivAq6F2SAPK9T7ZLy2onlSFFdBuGswQE1E5fOhaXN5XDGvYKG9fW0m
	RfLgTV_JJQeZURuL2Gkiyd1NUsIRnzb9IiklyFJc4H.NdSvQmX.eibQd4B775i0.vuMCqeiwbXLI
	gG6llpRRhcYoo6V7vUdlL89H2nuq5K8u_cmDVxrvh5fnwP210E8bVdW4r0ANUtFSJ3mlFFeVkgnd
	.zUw.3wWQCs3itaXWE92riW3QB2uRdXw-
Received: from sonic.gate.mail.ne1.yahoo.com by
	sonic316.consmr.mail.ne1.yahoo.com with HTTP;
	Fri, 4 Sep 2020 23:58:50 +0000
Received: by smtp423.mail.bf1.yahoo.com (VZM Hermes SMTP Server) with ESMTPA
	ID a395354623817bca1029a7e7161b6f91; 
	Fri, 04 Sep 2020 23:58:46 +0000 (UTC)
Subject: Re: [PATCH v20 05/23] net: Prepare UDS for security module stacking
To: Paul Moore <paul@paul-moore.com>
References: <20200826145247.10029-1-casey@schaufler-ca.com>
	<20200826145247.10029-6-casey@schaufler-ca.com>
	<CAHC9VhSh=r4w_3mZOUwmKN0UxCMxPNGKd=_vr_iGV06rvCNbSA@mail.gmail.com>
	<1eeef766-405f-3800-c0cf-3eb008f9673e@schaufler-ca.com>
	<CAHC9VhSf8RWUnRPYLR6LLzbn-cvNg8J0wnZGwTOAe=dOqkvd0g@mail.gmail.com>
From: Casey Schaufler <casey@schaufler-ca.com>
Message-ID: <ef6a049a-c6b9-370b-c521-4594aa73e403@schaufler-ca.com>
Date: Fri, 4 Sep 2020 16:58:44 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
	Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <CAHC9VhSf8RWUnRPYLR6LLzbn-cvNg8J0wnZGwTOAe=dOqkvd0g@mail.gmail.com>
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
Cc: john.johansen@canonical.com, selinux@vger.kernel.org,
	James Morris <jmorris@namei.org>,
	linux-security-module@vger.kernel.org, linux-audit@redhat.com,
	casey.schaufler@intel.com, Stephen Smalley <sds@tycho.nsa.gov>
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
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Language: en-US

On 9/4/2020 2:53 PM, Paul Moore wrote:
> On Fri, Sep 4, 2020 at 5:35 PM Casey Schaufler <casey@schaufler-ca.com> wrote:
>> On 9/4/2020 1:08 PM, Paul Moore wrote:
>>> On Wed, Aug 26, 2020 at 11:07 AM Casey Schaufler <casey@schaufler-ca.com> wrote:
>>>> Change the data used in UDS SO_PEERSEC processing from a
>>>> secid to a more general struct lsmblob. Update the
>>>> security_socket_getpeersec_dgram() interface to use the
>>>> lsmblob. There is a small amount of scaffolding code
>>>> that will come out when the security_secid_to_secctx()
>>>> code is brought in line with the lsmblob.
>>>>
>>>> Signed-off-by: Casey Schaufler <casey@schaufler-ca.com>
>>>> ---
>>>>  include/linux/security.h |  7 +++++--
>>>>  include/net/af_unix.h    |  2 +-
>>>>  include/net/scm.h        |  8 +++++---
>>>>  net/ipv4/ip_sockglue.c   |  8 +++++---
>>>>  net/unix/af_unix.c       |  6 +++---
>>>>  security/security.c      | 18 +++++++++++++++---
>>>>  6 files changed, 34 insertions(+), 15 deletions(-)
>>> ...
>>>
>>>> diff --git a/include/net/af_unix.h b/include/net/af_unix.h
>>>> index f42fdddecd41..a86da0cb5ec1 100644
>>>> --- a/include/net/af_unix.h
>>>> +++ b/include/net/af_unix.h
>>>> @@ -36,7 +36,7 @@ struct unix_skb_parms {
>>>>         kgid_t                  gid;
>>>>         struct scm_fp_list      *fp;            /* Passed files         */
>>>>  #ifdef CONFIG_SECURITY_NETWORK
>>>> -       u32                     secid;          /* Security ID          */
>>>> +       struct lsmblob          lsmblob;        /* Security LSM data    */
>>> As mentioned in a previous revision, I remain concerned that this is
>>> going to become a problem due to the size limit on unix_skb_parms.  I
>>> would need to redo the math to be certain, but if I recall correctly
>>> this would limit us to five LSMs assuming both that we don't need to
>>> grow the per-LSM size of lsmblob *and* the netdev folks don't decide
>>> to add more fields to the unix_skb_parms.
>>>
>>> I lost track of that earlier discussion so I'm not sure where it ended
>>> up, but if there is a viable alternative it might be a good idea to
>>> pursue it.
>> Stephen had concerns about the lifecycle management involved. He also
>> pointed out that I had taken a cowards way out when allocations failed.
>> That could result in unexpected behavior when an allocation failed.
>> Fixing that would have required a major re-write of the currently simple
>> UDS attribute code, which I suspect would be as hard a sell to netdev as
>> expanding the secid to a lsmblob. I also thought I'd gotten netdev on the
>> CC: for this patch, but it looks like I missed it.
>>
>> I did start on the UDS attribute re-do, and discovered that I was going
>> to have to introduce new failure paths, and that it might not be possible
>> to maintain compatibility for all cases because of the new possibilities
>> of failure.
> ... and you're hoping to not be responsible for this code by the time
> this becomes a limiting issue? ;)

Well, maybe. More likely that full dementia will have set in by the
time I get the alternative done correctly. It's a _lot_ more complicated.
I'm carefully watching what the BPF people are doing with their
memory management schemes in the hope they will come up with something
useful. 

> I understand the concerns you mention, they are all valid as far as
> I'm concerned, but I think we are going to get burned by this code as
> it currently stands.

Yes, I can see that. We're getting burned by the non-extensibility
of secids. It will take someone smarter than me to figure out how to
fit N secids into 32bits without danger of either failure or memory
allocation.

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

