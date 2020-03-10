Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 859C617EDFF
	for <lists+linux-audit@lfdr.de>; Tue, 10 Mar 2020 02:26:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1583803572;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post:autocrypt:autocrypt;
	bh=arwPZ9PFaaZbTvfJb8DdNIFIcOU11CLaDwbPSebRPzI=;
	b=NgDm3rNRZLA+YoY8UFrtvND5D23cDRwY4PFlR8igtOtP3xbWt1EVVDhe+EWp1FpzQeR2ic
	p6nqVXHldkz346M7wLvVDGua3wJlcYO27gmLAOOI5Sh8rsL3GTKZH/R4GY+S//qgmL89w6
	mY7rBuVrQ1FMqRC4zHwjiLV+dEFjJJQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-237-T4dmIUM5PSW2c6U-Sm7yfQ-1; Mon, 09 Mar 2020 21:26:10 -0400
X-MC-Unique: T4dmIUM5PSW2c6U-Sm7yfQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6B435184C805;
	Tue, 10 Mar 2020 01:26:05 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0B38D92D11;
	Tue, 10 Mar 2020 01:26:05 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3358B8449B;
	Tue, 10 Mar 2020 01:26:03 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 02A1PtDg004603 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 9 Mar 2020 21:25:55 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 4135ADEEE6; Tue, 10 Mar 2020 01:25:55 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3CF62D1E9D
	for <linux-audit@redhat.com>; Tue, 10 Mar 2020 01:25:53 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 587398BA51B
	for <linux-audit@redhat.com>; Tue, 10 Mar 2020 01:25:53 +0000 (UTC)
Received: from sonic309-28.consmr.mail.ne1.yahoo.com
	(sonic309-28.consmr.mail.ne1.yahoo.com [66.163.184.154]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-18-AYsH97bnNJOsLgd5K2i9fQ-1;
	Mon, 09 Mar 2020 21:25:49 -0400
X-MC-Unique: AYsH97bnNJOsLgd5K2i9fQ-1
X-YMail-OSG: T6Z0A2MVM1m2LD_iPRF3AGQ64Jtgfsh2Rn9a6L_gYNCXhp7ZUJGQ.J24uqLsdoi
	GgtE_JM1CzPjXTYIc6Wx9Q.OcbJFzCG3BCT_8uyRN6Dpqj5EMo4B.Fd5yCcm3miiYAv6aj3UbNCo
	3VwSFlHzo_wy76bYWTReBa61dc9gGMUEEDhYz9513uiytbrOGDJ0ZG5OnH.g5DAbYbI.Lc3NdPAg
	16cjZBcyuCPrQ70R.g6M.mQc9.9i61wDUqX6FmrBLzzDNZqiW1enx3S5jVBHdxbYl5jh8Sn3IaIN
	jnh0UxzAVOW_8YFzAY6qNn9HFk3yVITxo3i1CJJhkDuRMSRAHSx9R7ElYP1HKLlU7a7d6.ed.vYJ
	se0mcuZNzPPP99gQc6DvtCXtpPB83k4bsnPTaH42AC8IJdkPGx6CVMzP7xAFu6vvxrm9sRXbA3OD
	9ZWvv.z9HSnuMwdn3VWpSiBSM5cjprlCVUSpX0hN4MiwVgJdZZtjYgTcqp5_IxZ3Ni0Ln6vX5IW4
	RyIAI11MItGAze4HNrQDYB08OM_e3Y6uILbaCPnQ5uvIG61OyKjEsZ0j0sACsfTTtZ0lGaV.Fx_w
	YGxTULz1ped6MPUGseiOPhkLEGjZScFMbDvV_nMXIx.KPOP9eig63YcKZBBtN4kvZtoZmyb7yCkk
	vVu0EXIbE913lNKchxcSw7CI0axtFjsjK494w6JZ0lK8_XSqQKtfXkpzUDEMoUfzh9nlRms.6ZIw
	0Q2MOjRaSwHTW1nzbGJdf0xP5yPR8Y1qphHpd8QwhLVg2IA2cOUeQx130LrdK6NWrEbYO.shV7XV
	4.7ojO5JDY_tefvm38HlmdSHuUj3UscjxUKKgHANiWh4ngWgUb1QRUPBqiRvYRUyroaw6yqvXySD
	YFbzFzXWoQT_cFf2Wl5CtF1USZJWEagc6_teqBAY1enXc21ANzeRPt01ykkF6Kf3uH_Vm4INF6qr
	UBM1yCLF.QFkykt9gT8719Flwy3QRpemo2LfI0u31KQpc0noB4cT6LjyLTKit9WlkT3LhuceuP_3
	Wo2qwMdGGfRtR1ibqGeMwSxazPFNJ8tKXmX0tkrYhZnRljI9iW6J82oXyb4cQSiSjFwxa6YOgnyf
	QKQUql_7C73w6t8lJqpY2Ut32inQ.KYCZ2svdhLpUdscj0NN.Vv_MF8ZfCuCPckFdT5aOHUf87t2
	sEnYEAHfiqWpCowlN0kYK71YyH5mKkweosTPVK9hRWKpLbHC0y1CnAyaAbvEwwMWN1vfWpFtJYZU
	q9z1iwBKCqFBYLV8dzVMuvygrPbJsMHq4CAopUsje7ABUlHil2PVD7KbCb6KB32BXTobSVIQB3k.
	TB7bYiCO4cdU3swQ8hGB8KfdV1.xkp7NW1tehYu3hIBvYnlm_wvQXU2P9dfwkO6B8Ed7m1xNjBzs
	Za0JTac24_w--
Received: from sonic.gate.mail.ne1.yahoo.com by
	sonic309.consmr.mail.ne1.yahoo.com with HTTP;
	Tue, 10 Mar 2020 01:25:48 +0000
Received: by smtp406.mail.ne1.yahoo.com (Oath Hermes SMTP Server) with ESMTPA
	ID 54add56958d17d91c0b3d15fb724f0b7; 
	Tue, 10 Mar 2020 01:25:46 +0000 (UTC)
Subject: Re: [PATCH v15 20/23] Audit: Add subj_LSM fields when necessary
To: Paul Moore <paul@paul-moore.com>
References: <20200222000407.110158-1-casey@schaufler-ca.com>
	<20200222000407.110158-13-casey@schaufler-ca.com>
	<CAHC9VhQ+zmB8zxYz0_jfk1SHkkYjUcDpHw1FzKH8G7GkenpH0g@mail.gmail.com>
From: Casey Schaufler <casey@schaufler-ca.com>
Autocrypt: addr=casey@schaufler-ca.com; keydata=
	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
	abzjfg==
Message-ID: <f13ce474-4e96-3132-69da-6438a341d254@schaufler-ca.com>
Date: Mon, 9 Mar 2020 18:25:45 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
	Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <CAHC9VhQ+zmB8zxYz0_jfk1SHkkYjUcDpHw1FzKH8G7GkenpH0g@mail.gmail.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 02A1PtDg004603
X-loop: linux-audit@redhat.com
Cc: casey.schaufler@intel.com, linux-audit@redhat.com
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 3/6/2020 6:24 PM, Paul Moore wrote:
> On Fri, Feb 21, 2020 at 7:06 PM Casey Schaufler <casey@schaufler-ca.com> wrote:
>> Add record entries to identify subject data for all of the
>> security modules when there is more than one.
>>
>> Acked-by: Stephen Smalley <sds@tycho.nsa.gov>
>> Signed-off-by: Casey Schaufler <casey@schaufler-ca.com>
>> Cc: netdev@vger.kernel.org
>> Cc: linux-audit@redhat.com
>> ---
>>  drivers/android/binder.c                |  2 +-
>>  include/linux/audit.h                   |  1 +
>>  include/linux/security.h                |  9 ++++-
>>  include/net/scm.h                       |  3 +-
>>  kernel/audit.c                          | 40 ++++++++++++++++++-
>>  kernel/audit_fsnotify.c                 |  1 +
>>  kernel/auditfilter.c                    |  1 +
>>  kernel/auditsc.c                        | 10 +++--
>>  net/ipv4/ip_sockglue.c                  |  2 +-
>>  net/netfilter/nf_conntrack_netlink.c    |  4 +-
>>  net/netfilter/nf_conntrack_standalone.c |  2 +-
>>  net/netfilter/nfnetlink_queue.c         |  2 +-
>>  net/netlabel/netlabel_unlabeled.c       | 11 ++++--
>>  net/netlabel/netlabel_user.c            |  2 +-
>>  net/xfrm/xfrm_policy.c                  |  2 +
>>  net/xfrm/xfrm_state.c                   |  2 +
>>  security/integrity/ima/ima_api.c        |  1 +
>>  security/integrity/integrity_audit.c    |  1 +
>>  security/security.c                     | 51 +++++++++++++++++++++++--
>>  19 files changed, 124 insertions(+), 23 deletions(-)
> ...
>
>> diff --git a/kernel/audit.c b/kernel/audit.c
>> index a25097cfe623..c3a1d8d2d33c 100644
>> --- a/kernel/audit.c
>> +++ b/kernel/audit.c
>> @@ -2054,6 +2061,33 @@ void audit_log_key(struct audit_buffer *ab, char *key)
>>                 audit_log_format(ab, "(null)");
>>  }
>>
>> +void audit_log_task_lsms(struct audit_buffer *ab)
>> +{
>> +       int i;
>> +       const char *lsm;
>> +       struct lsmblob blob;
>> +       struct lsmcontext context;
>> +
>> +       /*
>> +        * Don't do anything unless there is more than one LSM
>> +        * with a security context to report.
>> +        */
>> +       if (security_lsm_slot_name(1) == NULL)
>> +               return;
>> +
>> +       security_task_getsecid(current, &blob);
>> +
>> +       for (i = 0; i < LSMBLOB_ENTRIES; i++) {
>> +               lsm = security_lsm_slot_name(i);
>> +               if (lsm == NULL)
>> +                       break;
>> +               if (security_secid_to_secctx(&blob, &context, i))
>> +                       continue;
>> +               audit_log_format(ab, " subj_%s=%s", lsm, context.context);
>> +               security_release_secctx(&context);
>> +       }
>> +}
>> +
>>  int audit_log_task_context(struct audit_buffer *ab)
>>  {
>>         int error;
>> @@ -2064,7 +2098,7 @@ int audit_log_task_context(struct audit_buffer *ab)
>>         if (!lsmblob_is_set(&blob))
>>                 return 0;
>>
>> -       error = security_secid_to_secctx(&blob, &context);
>> +       error = security_secid_to_secctx(&blob, &context, LSMBLOB_FIRST);
>>         if (error) {
>>                 if (error != -EINVAL)
>>                         goto error_path;
> Sorry, please disregard my previous ACK.

:(

> We should treat "subj=" similar to how we treat "obj="; if there is
> more than one LSM loaded the "subj=" should be set to "?" with the
> "subj_XXX=" set to the appropriate label for the named LSM.  This
> patch looks like it is always using LSMBLOB_FIRST and not "?" when
> multiple LSMs are present.

I'm fine with that, although I could see someone suggesting that
would constitute breaking backward compatibility.


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

